# Back to 2000 운영·복구 안내

## 배포 전 순서

1. `npm run quality`로 코드·렌더링·카탈로그·이미지를 전부 검사한다.
2. `npm run cloudflare:backup`으로 운영 D1 전체 SQL 사본을 만든다.
3. `npm run cloudflare:verify-backup`으로 사본을 격리된 SQLite 검증 DB에 복원하고 핵심 테이블 수를 확인한다.
4. `npm run cloudflare:migrate`로 새 마이그레이션을 적용한다.
5. 관리자 품질 현황과 주요 사용자 흐름을 확인한 뒤 `npm run cloudflare:deploy`를 실행한다.

백업 파일은 `backups/`에 생성되며 Git에는 포함하지 않는다. 장기 보존 사본은 접근이 제한된 별도 저장소로 옮긴다.

## D1 복구

운영 데이터 복구는 파괴적인 작업이다. 먼저 현재 상태를 다시 내보내고, 복원할 SQL 사본을 `npm run cloudflare:verify-backup -- <파일>`로 검증한다. Cloudflare D1 Time Travel을 사용할 때도 복원 직전 북마크를 기록한다. 복구 직후에는 콘텐츠 수, 관리자 로그인, 컬렉션 저장과 이미지 조회를 확인한다.

## 세션·계정 사고 대응

- 비밀번호가 노출됐다고 의심되면 계정 화면에서 즉시 변경한다. 변경 시 기존 세션이 모두 폐기되고 현재 기기에 새 세션이 발급된다.
- 관리자 계정은 공유하지 않으며 `AUTH_PEPPER`는 Worker secret으로만 관리한다.
- 인증 오류 급증 시 Worker 로그에서 구조화된 오류를 확인하고 로그인 시도 제한을 우회하지 않는다.
- 운영자가 접근할 수 없으면 새 임시 관리자 계정을 D1에서 만들기 전에 현재 D1 백업을 남긴다.

## 배포 후 점검

- `/`, `/years/1998`, `/timelines/game`, `/collection`, `/auth`, `/admin` 응답과 주요 버튼을 확인한다.
- 관리자 품질 현황이 이미지 없음 0, 근거 없음 0, 재검토 0인지 확인한다.
- 404 화면, 키보드 연도 이동, 모션 감소 설정, 모바일 연도 선택을 확인한다.
- 문제가 생기면 Cloudflare의 직전 Worker 버전으로 롤백하고 필요할 때만 검증한 D1 사본 또는 Time Travel을 사용한다.
