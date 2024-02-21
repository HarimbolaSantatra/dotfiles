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

## Install package
To install all the package:

**Using dpkg:**

    dpkg --set-selections < pkg-list

**Using apt:**

    apt-get delect-upgrade

## Current Issue
tmux start and stop immediatly if you run it with `tmux`. Issue is probably linked with Tmux Continuum. Instead, you should use a session name:

    tmux new -s SESSION
