#!/usr/bin/env bash
rsync_flags="-auP"
config_path="/home/$USER/.config"
rsync $rsync_flags fish/ $config_path/fish/
rsync $rsync_flags i3/config $config_path/i3/
rsync $rsync_flags nvim/ $config_path/nvim/
rsync $rsync_flags .bashrc .bash_aliases $HOME
rsync $rsync_flags .tmux.conf $HOME
rsync $rsync_flags bin/ $HOME/.local/bin/
