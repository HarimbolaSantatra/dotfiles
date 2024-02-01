# DOTFILES
Includes all my configuration.
- Xmodmap
- vim and neovim
- shell (fish and bash)
- i3
- tmux
- a list of package
- ...

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
