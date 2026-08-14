import { env } from "cloudflare:workers";

const encoder = new TextEncoder();
export const PASSWORD_ITERATIONS = 100_000;

function bytesToBase64(bytes: Uint8Array) {
  let binary = "";
  for (const byte of bytes) binary += String.fromCharCode(byte);
  return btoa(binary);
}

function base64ToBytes(value: string) {
  const binary = atob(value);
  return Uint8Array.from(binary, (character) => character.charCodeAt(0));
}

function bytesToHex(bytes: Uint8Array) {
  return Array.from(bytes, (byte) => byte.toString(16).padStart(2, "0")).join("");
}

function asArrayBuffer(bytes: Uint8Array) {
  return bytes.slice().buffer as ArrayBuffer;
}

async function derivePassword(password: string, salt: Uint8Array, iterations: number) {
  const key = await crypto.subtle.importKey("raw", encoder.encode(password), "PBKDF2", false, ["deriveBits"]);
  return new Uint8Array(await crypto.subtle.deriveBits({ name: "PBKDF2", hash: "SHA-256", salt: asArrayBuffer(salt), iterations }, key, 256));
}

async function applyPepper(hash: Uint8Array) {
  const pepper = env.AUTH_PEPPER;
  if (!pepper || pepper.length < 32) throw new Error("AUTH_PEPPER is unavailable");
  const key = await crypto.subtle.importKey("raw", encoder.encode(pepper), { name: "HMAC", hash: "SHA-256" }, false, ["sign"]);
  return new Uint8Array(await crypto.subtle.sign("HMAC", key, asArrayBuffer(hash)));
}

export async function hashPassword(password: string) {
  const salt = crypto.getRandomValues(new Uint8Array(16));
  const hash = await applyPepper(await derivePassword(password, salt, PASSWORD_ITERATIONS));
  return { hash: bytesToBase64(hash), salt: bytesToBase64(salt), iterations: PASSWORD_ITERATIONS };
}

export async function verifyPassword(password: string, encodedHash: string, encodedSalt: string, iterations: number) {
  const actual = await applyPepper(await derivePassword(password, base64ToBytes(encodedSalt), iterations));
  const expected = base64ToBytes(encodedHash);
  const subtle = crypto.subtle as SubtleCrypto & { timingSafeEqual(left: ArrayBuffer, right: ArrayBuffer): boolean };
  return actual.byteLength === expected.byteLength && subtle.timingSafeEqual(asArrayBuffer(actual), asArrayBuffer(expected));
}

export function randomSessionToken() {
  return bytesToBase64(crypto.getRandomValues(new Uint8Array(32))).replaceAll("+", "-").replaceAll("/", "_").replaceAll("=", "");
}

export async function hashSessionToken(token: string) {
  return bytesToHex(new Uint8Array(await crypto.subtle.digest("SHA-256", encoder.encode(token))));
}
