// Daily repository inventory. No package installation, deployment, or application tests.
const fs = require('node:fs');
const path = require('node:path');
const crypto = require('node:crypto');
const {execFileSync} = require('node:child_process');
const config = {
  "repository": "Dotoryman/Back-to-2000",
  "kind": "web",
  "source_roots": [
    "app",
    "components",
    "domain",
    "infrastructure",
    "lib",
    "worker",
    "static-src"
  ],
  "migration_roots": [
    "drizzle",
    "migrations"
  ],
  "cloudflare_config": "wrangler.production.jsonc"
};
const output = process.argv[2] || 'maintenance/status.json';
const now = new Date();
const date = new Intl.DateTimeFormat('en-CA', {timeZone: 'Asia/Seoul', year:'numeric', month:'2-digit', day:'2-digit'}).format(now);
if (fs.existsSync(output) && JSON.parse(fs.readFileSync(output, 'utf8')).checked_date_kst === date) {
  console.log('Already checked on ' + date + '; no duplicate daily commit.');
  process.exit(0);
}
const git = (...args) => execFileSync('git', args, {encoding:'utf8'}).trim();
const files = git('ls-files', '-z').split('\0').filter(Boolean);
const inventory = files.filter(f => !f.startsWith('.github/') && !f.startsWith('maintenance/'));
const text = f => fs.readFileSync(f, 'utf8');
const checks = [];
const check = (name, passed, details) => checks.push({name, passed, details});
const count = predicate => inventory.filter(predicate).length;
const digest = crypto.createHash('sha256');
let bytes = 0;
for (const f of inventory.sort()) {
  const data = fs.readFileSync(f);
  bytes += data.length;
  digest.update(f).update('\0').update(String(data.length)).update('\0').update(data);
}
const details = {};
check('README present and nonempty', files.includes('README.md') && text('README.md').trim().length > 0, 'Tracked README.md');
if (config.kind === 'web') {
  const pkg = JSON.parse(text('package.json'));
  const lock = JSON.parse(text('package-lock.json'));
  const root = lock.packages && lock.packages[''];
  details.package = {name:pkg.name, version:pkg.version, node:pkg.engines?.node || 'not declared', scripts:Object.keys(pkg.scripts || {}).sort(), direct_dependencies:Object.keys(pkg.dependencies || {}).length, development_dependencies:Object.keys(pkg.devDependencies || {}).length, locked_packages:Object.keys(lock.packages || {}).filter(Boolean).length, lockfile_version:lock.lockfileVersion};
  check('npm lock root matches manifest', !!root && root.name === pkg.name && root.version === pkg.version && ['dependencies','devDependencies','optionalDependencies'].every(key => JSON.stringify(Object.entries(pkg[key] || {}).sort()) === JSON.stringify(Object.entries(root[key] || {}).sort())), 'Compared name, version and declared dependency specifications; npm ci was not run.');
  details.source_files = count(f => config.source_roots.some(r => f.startsWith(r + '/')) && /\.(tsx?|jsx?|mjs|cjs)$/.test(f));
  details.test_files = count(f => /(?:^|\/)(?:tests?|__tests__)\//.test(f) && /\.(tsx?|jsx?|mjs|cjs)$/.test(f) || /\.(?:test|spec)\.(tsx?|jsx?|mjs|cjs)$/.test(f));
  details.sql_migrations = count(f => config.migration_roots.some(r => f.startsWith(r + '/')) && f.endsWith('.sql'));
  details.public_assets = count(f => f.startsWith('public/'));
  check('Project source inventory nonempty', details.source_files > 0, config.source_roots.join(', '));
  check('Cloudflare configuration present', files.includes(config.cloudflare_config), config.cloudflare_config);
} else if (config.kind === 'ios') {
  const pbx = text('DotoryCount.xcodeproj/project.pbxproj');
  const values = key => [...new Set([...pbx.matchAll(new RegExp(key + ' = ([^;]+);', 'g'))].map(m => m[1]))].sort();
  details.swift_files = count(f => f.endsWith('.swift'));
  details.unit_test_files = count(f => f.startsWith('DotoryCountTests/') && f.endsWith('.swift'));
  details.ui_test_files = count(f => f.startsWith('DotoryCountUITests/') && f.endsWith('.swift'));
  details.widget_swift_files = count(f => f.startsWith('DotoryCountWidget/') && f.endsWith('.swift'));
  details.asset_catalog_entries = count(f => f.includes('.xcassets/') && f.endsWith('/Contents.json'));
  details.xcode = {marketing_versions:values('MARKETING_VERSION'), build_numbers:values('CURRENT_PROJECT_VERSION'), deployment_targets:values('IPHONEOS_DEPLOYMENT_TARGET')};
  for (const f of inventory.filter(f => f.includes('.xcassets/') && f.endsWith('/Contents.json'))) {
    const asset = JSON.parse(text(f));
    const missing = (asset.images || []).filter(image => image.filename && !files.includes(path.posix.join(path.posix.dirname(f), image.filename))).map(image => image.filename);
    check('Asset catalog: ' + f, missing.length === 0, {missing_files:missing});
  }
  check('Swift source and unit tests present', details.swift_files > 0 && details.unit_test_files > 0, 'Inventory only; Xcode build and tests were not run.');
  check('Xcode build settings present', details.xcode.marketing_versions.length > 0 && details.xcode.deployment_targets.length > 0, details.xcode);
} else {
  details.html_files = count(f => f.startsWith('dist/') && f.endsWith('.html'));
  details.css_files = count(f => f.startsWith('dist/') && f.endsWith('.css'));
  details.static_assets = count(f => f.startsWith('dist/assets/'));
  const external = new Set();
  for (const f of inventory.filter(f => f.startsWith('dist/') && f.endsWith('.html'))) {
    const missing = [];
    let references = 0;
    for (const m of text(f).matchAll(/\b(?:src|href)\s*=\s*["']([^"']+)["']/gi)) {
      const url = m[1];
      if (/^https?:\/\//i.test(url)) { external.add(url); continue; }
      if (/^(?:[a-z]+:|\/\/|#)/i.test(url)) continue;
      const clean = decodeURIComponent(url.split(/[?#]/)[0]);
      if (!clean) continue;
      references++;
      let target = clean.startsWith('/') ? path.posix.join('dist', clean.slice(1)) : path.posix.normalize(path.posix.join(path.posix.dirname(f), clean));
      if (clean.endsWith('/')) target = path.posix.join(target, 'index.html');
      if (!files.includes(target)) missing.push({reference:url, expected_file:target});
    }
    check('HTML local references: ' + f, missing.length === 0, {references_checked:references, missing});
  }
  details.external_links = [...external].sort();
  check('Portfolio entry point present', files.includes('dist/index.html'), 'External sites were not requested; this checks repository files only.');
}
const report = {
  schema_version:1,
  repository:config.repository,
  project_kind:config.kind,
  checked_date_kst:date,
  checked_at_utc:now.toISOString(),
  default_branch:process.env.DEFAULT_BRANCH || 'main',
  inspected_commit:git('rev-parse', 'HEAD'),
  workflow_run:process.env.GITHUB_RUN_ID ? 'https://github.com/' + config.repository + '/actions/runs/' + process.env.GITHUB_RUN_ID : null,
  inventory:{tracked_project_files:inventory.length, tracked_project_bytes:bytes, content_sha256:digest.digest('hex'), ...details},
  checks,
  result:checks.every(c => c.passed) ? 'passed' : 'attention_required',
  scope:'Repository structure, manifest consistency and tracked asset references only. Application tests, builds, dependency vulnerability scans and live service availability are not assessed.'
};
fs.mkdirSync(path.dirname(output), {recursive:true});
fs.writeFileSync(output, JSON.stringify(report, null, 2) + '\n');
console.log(report.repository + ': ' + report.result + ' (' + checks.length + ' checks), ' + date);
if (process.env.GITHUB_STEP_SUMMARY) fs.appendFileSync(process.env.GITHUB_STEP_SUMMARY, '## Daily maintenance: ' + report.result + '\n\nChecked ' + date + ' (KST). See maintenance/status.json for inventory and check results.\n');
