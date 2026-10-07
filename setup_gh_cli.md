# Setup GitHub CLI (gh)

Installs `gh` from GitHub's official apt repo. Ubuntu's own `gh` package is usually out of date.

## Install

1. Add GitHub's signing key:
   ```sh
   sudo mkdir -p -m 755 /etc/apt/keyrings
   wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null
   sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
   ```
2. Add the repo:
   ```sh
   echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
   ```
3. Install:
   ```sh
   sudo apt update && sudo apt install gh -y
   ```

## Log in

```sh
gh auth login
```

Pick GitHub.com, then a git protocol, then log in with the browser.

The protocol only sets which URL git uses for clones and pushes:

- **SSH:** use this if you already have a key on GitHub (`ls ~/.ssh/*.pub`). `gh` can upload an existing key or generate a new one.
- **HTTPS:** `gh` stores a token and acts as git's credential helper, so there are no keys to manage.

Switch later with `gh config set git_protocol ssh` (or `https`).

## Add the workflow scope

The default token can't create or edit files under `.github/workflows/`. Anything that does, like Claude Code's `/install-github-app`, fails with "missing required permission workflow". Add the scope:

```sh
gh auth refresh -h github.com -s workflow
```

To log in with it from the start, run `gh auth login -s workflow` instead of the plain login above.

## Verify

```sh
gh auth status
```

The "Token scopes" line should include `workflow`.
