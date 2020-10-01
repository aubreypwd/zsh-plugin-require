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

### 1.0.0

- First version
