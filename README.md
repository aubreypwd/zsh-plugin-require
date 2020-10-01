# `require`

Simple function you can use to require commands on your system, e.g.:

```bash
require "git" "brew install git"
```

...will detect `git`, and if you don't have it installed will automatically run `brew install git` for you to install it.

## Install

Using [antigen](https://github.com/zsh-users/antigen):

```bash
antigen bundle aubreypwd/zsh-plugin-require@1.0.0
```

## Development

Install the package on `master`:

```bash
antigen bundle aubreypwd/zsh-plugin-require
```

...and contribute upstream by working in `$HOME/.antigen/bundles/aubreypwd/zsh-plugin-require`.

---

## Changelog

### 1.0.1

- Added a 3rd option to specify a package manager's command be required, e.g.

```bash
require "foo" "brew reinstall bar" "brew"
```

This will run `brew reinstall bar` if the `foo` command is not found, only if the `brew` command is found (e.g. the `brew` homebrew package manager command), vs:

```bash
require "foo" "/bin/bash -c $(curl -fsSL https://example.com/install.sh)"
```

Which will run `/bin/bash -c $(curl -fsSL https://example.com/install.sh)` reguardless if any command without performing any checks (as it did before, and you can still do).

### 1.0.0

- First version
