# my dots

i use stow to manage my dotfiles. it's pretty clean, doesn't require as much of a learning curve as compared to something like nix or chezmoi. it's also pretty cozy that it's a native gnu/linux command so will work on most unix machines and WSL.

will add more in the future, but this is the lineup today:
- terminal emulator: kitty (config comes packed with the modifiers to have tmux-like window switching in nvim)
- editor: neovim (config heavily inspired by [Dillon Mulroy](https://github.com/dmmulroy))
- shell: zsh (sammy is premier theme change my mind)

## usage

`stow home -t ~`

`stow config -t ~/.config`
