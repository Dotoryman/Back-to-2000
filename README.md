# Back to 2000

> 1998년부터 2020년까지 한국의 인터넷, 휴대전화, 게임 문화를 탐험하는 인터랙티브 디지털 아카이브입니다.

[**라이브 데모**](https://backto2000.cloud) · [변경 기록](CHANGELOG.md) · [운영·복구 안내](docs/OPERATIONS.md) · [로드맵](docs/ROADMAP.md)

현재 버전 **0.4.3** · 공개 기록 **278개** · 대상 연도 **1998–2020**

## 주요 기능

- 연도별 웹사이트, 온라인 서비스, 휴대전화, 디지털 제품과 게임 탐색
- D1 기반 개인 추억 컬렉션과 계정별 보관 기능
- 전체 공개 기록의 검수 상태와 이미지 품질 점검
- 편집자·관리자 역할을 분리한 운영 스튜디오
- D1 백업, 격리 복원 검증, 장애 대응을 포함한 운영 절차

## 기술 스택

- **프런트엔드:** React 19, TypeScript, Vite, vinext, Framer Motion
- **백엔드:** Cloudflare Workers, Hono, Zod
- **데이터:** Cloudflare D1, R2, Drizzle ORM
- **운영:** Wrangler, Cloudflare Observability

## 로컬 개발

필수 환경은 Node.js 22.13 이상입니다.

```bash
npm install
npm run dev
```

주요 품질 검사는 다음 명령으로 실행합니다.

```bash
npm test
npm run lint
npm run quality:catalog
npm run quality:images
```

## Cloudflare 운영

운영 환경은 `wrangler.production.jsonc`의 `DB`(D1)와 `MEDIA`(R2) 바인딩을 사용합니다.

```bash
npm run cloudflare:backup
npm run cloudflare:verify-backup
npm run cloudflare:migrate
npm run cloudflare:deploy
```

백업과 격리 복원, 배포 후 확인, 장애 대응 절차는 [운영·복구 안내](docs/OPERATIONS.md)를 따릅니다. 비밀번호 pepper는 Worker secret `AUTH_PEPPER`로만 관리합니다.

## 프로젝트 구조

```text
app/             애플리케이션 화면과 라우트
components/      재사용 UI 컴포넌트
db/              D1 및 Drizzle 데이터 계층
domain/          도메인 모델과 규칙
worker/          Cloudflare Worker 진입점
tests/           자동화 테스트
docs/            운영, 복구, 로드맵 문서
```

## 문서

- [변경 기록](CHANGELOG.md): 버전별 변경 사항
- [운영·복구 안내](docs/OPERATIONS.md): 백업, 복원, 배포, 장애 대응
- [로드맵](docs/ROADMAP.md): 다음 개선 계획

과거 버전의 상세 변경 사항은 [CHANGELOG.md](CHANGELOG.md)에서 확인할 수 있습니다.
