# Scripts to create GitHub issues

This folder contains a small helper script to programmatically create the 12 user-story issues defined in `github-issues-template.md`.

Requirements
- curl, jq (for API path)
- Or: GitHub CLI (`gh`) configured and authenticated
- A GitHub personal access token with `repo` scope exported as `GITHUB_TOKEN` if you're not using `gh` authentication

Usage

Using a token:

```bash
export GITHUB_TOKEN="ghp_..."
./scripts/create_github_issues.sh
```

Using gh (if you've run `gh auth login`):

```bash
./scripts/create_github_issues.sh
```

Security
- Do not commit your `GITHUB_TOKEN` to source control.
- Use environment variables or the `gh` CLI to provide credentials.

Notes
- The script reads issue text blocks from `github-issues-template.md` and creates labeled issues with the `enhancement` label. You may want to review the created issues and adjust labels/assignees in GitHub directly.
