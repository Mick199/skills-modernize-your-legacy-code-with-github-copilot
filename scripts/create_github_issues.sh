#!/usr/bin/env bash
# Creates GitHub issues from the bundled markdown blocks.
# Usage: GITHUB_TOKEN=ghp_xxx ./create_github_issues.sh

set -euo pipefail

REPO="Mick199/skills-modernize-your-legacy-code-with-github-copilot"

if [[ -z "${GITHUB_TOKEN:-}" ]]; then
  if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
    USE_GH=true
  else
    echo "ERROR: GITHUB_TOKEN not set and gh CLI not authenticated. Export GITHUB_TOKEN or authenticate gh." >&2
    exit 1
  fi
else
  USE_GH=false
fi

create_issue_with_gh() {
  local title="$1"
  local body="$2"
  gh issue create --repo "$REPO" --title "$title" --body "$body" --label "enhancement" || return 1
}

create_issue_with_api() {
  local title="$1"
  local body="$2"
  curl -sS -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github+json" \
    https://api.github.com/repos/${REPO}/issues \
    -d $(jq -nc --arg t "$title" --arg b "$body" '{title:$t, body:$b, labels:["enhancement"]}') \
    | jq -r '.html_url'
}

create_issue() {
  local title="$1"
  local body="$2"
  if [[ "$USE_GH" == true ]]; then
    create_issue_with_gh "$title" "$body"
  else
    create_issue_with_api "$title" "$body"
  fi
}

# Issue definitions (title and body). Keep bodies compact; using heredocs.
declare -a ISSUES

ISSUES+=(
  "User Login Authentication (US-006)<<<$(sed -n '1,80p' ../github-issues-template.md | awk '/## Issue #1/{flag=1;next}/## Issue #2/{flag=0}flag{print}' )"
  "Account Security - Session Timeout (US-007)<<<$(sed -n '1,180p' ../github-issues-template.md | awk '/## Issue #2/{flag=1;next}/## Issue #3/{flag=0}flag{print}' )"
  "Transaction History Viewing (US-008)<<<$(sed -n '1,260p' ../github-issues-template.md | awk '/## Issue #3/{flag=1;next}/## Issue #4/{flag=0}flag{print}' )"
  "Balance Alerts and Notifications (US-009)<<<$(sed -n '1,340p' ../github-issues-template.md | awk '/## Issue #4/{flag=1;next}/## Issue #5/{flag=0}flag{print}' )"
  "Transfer Between Multiple Accounts (US-010)<<<$(sed -n '1,420p' ../github-issues-template.md | awk '/## Issue #5/{flag=1;next}/## Issue #6/{flag=0}flag{print}' )"
  "Monthly Spending Reports (US-011)<<<$(sed -n '1,500p' ../github-issues-template.md | awk '/## Issue #6/{flag=1;next}/## Issue #7/{flag=0}flag{print}' )"
  "Export Account Data (US-012)<<<$(sed -n '1,580p' ../github-issues-template.md | awk '/## Issue #7/{flag=1;next}/## Issue #8/{flag=0}flag{print}' )"
  "Account Recovery System (US-013)<<<$(sed -n '1,660p' ../github-issues-template.md | awk '/## Issue #8/{flag=1;next}/## Issue #9/{flag=0}flag{print}' )"
  "Data Persistence Implementation (US-014)<<<$(sed -n '1,740p' ../github-issues-template.md | awk '/## Issue #9/{flag=1;next}/## Issue #10/{flag=0}flag{print}' )"
  "Web Interface Development (US-015)<<<$(sed -n '1,820p' ../github-issues-template.md | awk '/## Issue #10/{flag=1;next}/## Issue #11/{flag=0}flag{print}' )"
  "Mobile Compatibility (US-016)<<<$(sed -n '1,900p' ../github-issues-template.md | awk '/## Issue #11/{flag=1;next}/## Issue #12/{flag=0}flag{print}' )"
  "API Integration Capabilities (US-017)<<<$(sed -n '1,999p' ../github-issues-template.md | awk '/## Issue #12/{flag=1;next}/## Summary/{flag=0}flag{print}' )"
)

echo "Preparing to create ${#ISSUES[@]} issues in $REPO"

for item in "${ISSUES[@]}"; do
  title=${item%%<<<*}
  body=${item#*<<<}
  echo "Creating: $title"
  if url=$(create_issue "$title" "$body"); then
    echo "Created: $url"
  else
    echo "Failed to create issue: $title" >&2
  fi
  # brief sleep to avoid rate limits
  sleep 0.5
done

echo "Done."
