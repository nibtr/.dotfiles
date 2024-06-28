# .dotfiles

The repo contains all of my dotfile configurations, allowing for backup and a consistent experience accross multiple machines. The dotfiles are managed with [GNU stow](https://www.gnu.org/software/stow/).

**Note**: The configurations are curated to fit my workflow and may not fit everyone else's.

## Prerequisites

- Git
- GNU stow

## Content

These are my main configs:

- neovim config
- zsh config
- i3 config
- alacritty config
- rofi config
- custom scripts

There are also other configs (that I don't use often).

## Install

Run the following to stow every dir:

```bash
stow -t ~ */
```

- `-t ~` is to target the parent dir is the $HOME.
- `*/` means to stow every dir in this repo.

You can run the following to see what's going on without modify your filesystem:

```bash
stow -nv -t ~ */
```

- `-nv` is to simulate and verbose.

To stow a specific folder, run:

```bash
stow -t ~ <folder_name>
# or
stow -nv -t ~ <folder_name>
# to see what's going on
```

This will create a symlink from the dir in the repo to the specific location in $HOME.
