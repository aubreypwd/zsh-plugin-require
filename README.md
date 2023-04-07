# `require`

Simple function you can use to require commands on your system, e.g.:

```bash
require "git" "brew install git"
```

...will detect `git`, and if you don't have it installed will automatically run `brew install git` for you to install it.

```bash
require "git" "brew install git" "brew"
```

Will only run `brew install git` if the command `git` is missing and `brew` is available to install it.

- Add `export REQUIRE_AUTO_INSTALL="off"` to `~/.zshrc` to turn off auto installation of `require`.

## Install

Using [antigen](https://github.com/zsh-users/antigen):

```bash
antigen bundle aubreypwd/zsh-plugin-require
```

When you have this installed, any other plugins that use it will automatically be able to manage dependancies automatically. 

## Development

Install the package on `master`:

```bash
antigen bundle ssh://git@github.com/aubreypwd/zsh-plugin-require
```

...and contribute upstream by working in `$HOME/.antigen/bundles/aubreypwd/zsh-plugin-require`.