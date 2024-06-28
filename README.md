# .dotfiles

The repo contains all of my dotfile configurations, allowing for backup and a consistent experience accross multiple machines.

## Prerequisites

- Git
- GNU stow

## Layout

The layout of this repo is divided into separate folders for their own configurations, e.g. tmux is for tmux's configuration files. Each folder "represents" the $HOME folder, which means when you're in a specific folder, consider it as your $HOME folder. For example, `.zshrc` lives in your $HOME folder, so in the `zsh` folder (now is your $HOME), there's a file `.zshrc`. The same goes with other files.

## Quickstart

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
