# DOTFILES
Includes all my configuration.
- Xmodmap
- vim and neovim
- shell (fish and bash)
- i3
- tmux
- a list of package
- ...

## Files
- `bin/fix-bookmarks.sh`: sync firefox bookmarks (`./bookmarks.html`) to qutebrowser
- `bin/commit-quickmarks.sh`: sync current quickmarks to git
- `bookmarks.html`: firefox bookmarks
- `install-script/`: all installation script
- `setup.sh`: setup all configuration in their respective place
- **Utils**:
- - [Hugo](https://gohugo.io/getting-started/quick-start/): static site generator
- - [thefuck](https://github.com/nvbn/thefuck)
- - [figlet](https://www.npmjs.com/package/figlet): command line banner generator

## i3 touchpad
To fix the 'touch' function on the touchpad when using i3, follow these instructions. ([ Source ](https://cravencode.com/post/essentials/enable-tap-to-click-in-i3wm/))

    sudo mkdir -p /etc/X11/xorg.conf.d
    cd /etc/X11/xorg.conf.d

then, copy the content of `files/90-touchpad.conf` inside it.

## Current Issue
### Tmux
tmux start and stop immediatly if you run it with `tmux`. Issue is probably linked with Tmux Continuum. Instead, you should use a session name:

    tmux new -s SESSION

### i3
Sometimes, on different host, change keyboard remap is not working on i3. In this case, run `./bin/fix-i3`

## TODO
- Add confirmation before install a package so the user can select which package to install.
