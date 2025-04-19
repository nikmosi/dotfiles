source (dirname (status -f))/conf.d/env.fish

function tmux_pick
    sesh connect (
            sesh list --icons | fzf \
              --no-sort --ansi --border-label ' sesh ' --prompt '⚡  ' \
              --header '  ^a all ^t tmux ^g configs ^x zoxide ^d tmux kill ^f find' \
              --bind 'tab:down,btab:up' \
              --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list --icons)' \
              --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t --icons)' \
              --bind 'ctrl-g:change-prompt(⚙️  )+reload(sesh list -c --icons)' \
              --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z --icons)' \
              --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
              --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)' \
              --preview-window 'right:55%' \
              --preview 'sesh preview {}'
          )
end


if status is-interactive
    starship init fish | source
    zoxide init fish | source

    bind \cx\ce edit_command
    bind \co copy_current_command

    abbr - 'z -'
    abbr --position anywhere -a ... ../..
    abbr --position anywhere -a .... ../../..
    abbr --position anywhere -a ..... ../../../..
    abbr --position anywhere -a ...... ../../../../..

    abbr -a CA --position anywhere '2>&1 | cat -A'

    abbr -a H --position anywhere '| head'
    abbr -a L --position anywhere '| less'
    abbr -a G --position anywhere '| rg'
    abbr -a LL --position anywhere '2>&1 | less'
    abbr -a M --position anywhere '| most'
    abbr -a NE --position anywhere '2> /dev/null'
    abbr -a NUL --position anywhere '> /dev/null 2>&1'
    abbr -a P --position anywhere '2>&1| pygmentize -l pytb'
    abbr -a T --position anywhere '| tail'
    abbr -a _ --position anywhere sudo

    function startwine
        env '/home/nik/.local/share/StartWine/data/runtime/sw'
    end
    function tp --wraps tmux
        tmux_pick $argv
    end
    function abs --wraps readlink
        readlink -f $argv
    end
    function cat --wraps bat
        bat $argv
    end
    function d --wraps ripdrag
        ripdrag -a -x $argv
    end
    function ddate --wraps date
        date -u +%Y-%m-%dT%H:%M:%S $argv
    end
    function md --wraps mkdir
        mkdir -p $argv
    end
    function rd --wraps rmdir
        rmdir $argv
    end
    function mv --wraps mv
        mv -i $argv
    end
    function cp --wraps cp
        cp -i $argv
    end
    function py --wraps python
        python $argv
    end
    function rename --wraps perl-rename
        perl-rename $argv
    end
    function sortnr --wraps sort
        sort -n -r $argv
    end
    function tt --wraps tail
        tail -f $argv
    end
    function to_clip --wraps xclip
        xclip -sel clip $argv
    end
    function which-command --wraps whence
        whence $argv
    end
    function ww --wraps ls
        ls *mkv | head -n 1 | tee $TTY | xargs -I {} mv {} {}_ $argv
    end
    function x --wraps extract
        extract $argv
    end
end
