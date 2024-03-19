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

# mkdir and cd in one command
function mkcd
    mkdir -p -- "$argv[1]" && cd -- "$argv[1]"
end

# move files and folder in a new directory
function mvdir
    set new_dir $argv[1]
    mkdir -p $new_dir
    for element in $argv[2..-1]
        echo "mv $element $new_dir"
        mv $element $new_dir
    end
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

# LazyGit
function lazygit
    git add .
    if test (count $argv) -eq 1
	set -l comment "$argv[1]"
    else
	set -l comment "LazyGit"
    end
    git commit -a -m $comment
    git push
end


# Create html template
function init_html
    set template "/home/santatra/projet_kely/web/simplehtml/boilerplate.html"
    cp $template ./index.html
end

# Initialize zoxide
zoxide init fish | source

# set thefuck alias
thefuck --alias | source
