if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    echo Hello $USER !
end

# Change color if user is root
if fish_is_root_user
    function fish_prompt
	printf '%s%s@%s%s %s%s %s# ' (set_color --bold green) $USER (set_color normal) $hostname (set_color bryellow) (prompt_pwd) (set_color red)
    end
end


# USER DEFINED FUNCTION
function mkcd
    mkdir -p -- "$argv[1]" && cd -- "$argv[1]"
end

function cl
    argparse h/help -- $argv
    or return
    if set -ql _flag_help
        echo "cdls [-h|--help]  [DIRECTORY ...]"
        return 0
    end

    cd "$argv[1]" && ls
end

function ydxsel
    set dir (pwd)
    echo "$dir" | xsel -b;
    if test $status -eq 0
	echo 'Yanked in clipboard with xsel!'
    else
	echo 'Error in yanking. See sdrerr above'
    end
end


# Find
function find_file
    find . -type f -iname "*$1*" -print
end
function find_dir
    find . -type d -iname "*$1*" -print
end


# Create html template
function init_html
    set template "/home/santatra/projet_kely/web/simplehtml/boilerplate.html"
    cp $template ./index.html
end

# =============== NNN config ===============
set -x NNN_FCOLORS 'c1e2272e006033f7c6d6abc4'
set -x NNN_PLUG 'f:fzcd;o:fzopen;g:organize;p:preview-tui;x:!chmod +x "$nnn"'
set -x NNN_FIFO '/tmp/nnn.fifo'
set -x NNN_TRASH 2
function n3
    # Block nesting of nnn in subshells
    if test "(NNNLVL:-0)" -eq 0
        echo "nnn is already running"
        return
    end

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    set -x NNN_TMPFILE "(XDG_CONFIG_HOME:-$HOME/.config)/nnn/.lastd"

    if ! -f "$NNN_TMPFILE"
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    end
end


# Initialize zoxide
zoxide init fish | source
