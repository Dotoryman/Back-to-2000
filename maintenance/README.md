# Daily repository maintenance

[Latest repository report](status.json) is generated daily at 09:00 Asia/Seoul (00:00 UTC) by [Daily repository maintenance](../.github/workflows/daily-maintenance.yml). GitHub can delay or drop scheduled jobs during high load; this is not an exact-time guarantee. Run workflow_dispatch on the default branch to recover a missed run.

The report records the actual inspection time, inspected commit, project inventory, content fingerprint and structural check results. Project kind: **web**. A failed structural check is recorded as attention_required so the report remains useful; script or push failures fail the workflow. This does not claim that application tests, builds, deployed services or security scans passed. No production secrets or additional credentials are needed.

Only maintenance/status.json is committed by the workflow, at most once per KST calendar day. Manual reruns on the same day do not create another commit. The script uses only Node.js built-ins and reads tracked repository files. Existing code, README and other workflows are preserved.

The workflow runs only on the default branch with contents: write and all other GITHUB_TOKEN permissions disabled. Actions are pinned to commit SHAs. Reports are authored as Dotoryman <134985085+Dotoryman@users.noreply.github.com>, verified against this account's existing commits. Commits in this non-fork repository's default branch meet the author/branch conditions for GitHub contributions; the graph can take up to 24 hours to update.

GitHub may disable scheduled workflows in public repositories after 60 days without activity. Check the Actions tab if reports stop. GITHUB_TOKEN pushes do not trigger push workflows, so this maintenance task does not launch existing deployment or iOS CI workflows.

References: [scheduled workflows](https://docs.github.com/en/actions/reference/workflows-and-actions/events-that-trigger-workflows#schedule), [contribution requirements](https://docs.github.com/en/account-and-profile/reference/profile-contributions-reference), [GITHUB_TOKEN event behavior](https://docs.github.com/en/actions/how-tos/write-workflows/choose-when-workflows-run/trigger-a-workflow).
