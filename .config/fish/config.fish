source (dirname (realpath (status -f)))/conf.d/env.fish

if status is-interactive
    alias startwine="env '/home/nik/.local/share/StartWine/data/runtime/sw'"
    alias wu="nix-shell -p wireguard-tools --run 'wg-quick up wg0'"
    alias wd="nix-shell -p wireguard-tools --run 'wg-quick down wg0'"
    starship init fish | source
    zoxide init fish | source
    direnv hook fish | source

    bind \cx\ce edit_command
    bind \co copy_current_command

    abbr - 'z -'
    abbr --position anywhere -a ... ../..
    abbr --position anywhere -a .... ../../..
    abbr --position anywhere -a ..... ../../../..
    abbr --position anywhere -a ...... ../../../../..

    abbr -a CA --position anywhere '2>&1 | cat -A'

    abbr -a H --position anywhere  '| head'
    abbr -a L --position anywhere '| less'
    abbr -a G --position anywhere '| rg'
    abbr -a LL --position anywhere '2>&1 | less'
    abbr -a M --position anywhere '| most'
    abbr -a NE --position anywhere '2> /dev/null'
    abbr -a NUL --position anywhere '> /dev/null 2>&1'
    abbr -a P --position anywhere '2>&1| pygmentize -l pytb'
    abbr -a T --position anywhere '| tail'
    abbr -a _ --position anywhere 'sudo'

    alias tp="sesh connect (sesh list | fzf)"
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
