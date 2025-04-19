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
    alias startwine="env '/home/nik/.local/share/StartWine/data/runtime/sw'"
    alias wu="nix-shell -p wireguard-tools --run 'wg-quick up wg0'"
    alias wd="nix-shell -p wireguard-tools --run 'wg-quick down wg0'"
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

    alias tp=tmux_pick
    alias abs='readlink -f'
    alias cat=bat
    alias d='ripdrag -a -x'
    alias ddate='date -u +%Y-%m-%dT%H:%M:%S'

    alias md='mkdir -p'
    alias rd=rmdir
    alias mv='mv -i'
    alias cp='cp -i'
    alias py=python
    alias rename=perl-rename
    alias sortnr='sort -n -r'
    alias tt='tail -f'
    alias to_clip='xclip -sel clip'
    alias tree='exa --tree'
    alias which-command=whence
    alias ww='ls *mkv | head -n 1 | tee $TTY | xargs -I {} mv {} {}_'
    alias x=extract
end
