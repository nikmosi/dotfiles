function fish_greeting
end

set -x fish_tmux_autostart false
set -x fish_tmux_autostarted false
set -x fish_tmux_config "$HOME/.config/tmux/tmux.conf"

if status is-interactive
    alias wu="nix-shell -p wireguard-tools --run 'wg-quick up wg0'"
    alias wd="nix-shell -p wireguard-tools --run 'wg-quick down wg0'"
    function take
        md $argv[1]
        z $argv[1]
    end
    # Commands to run in interactive sessions can go here
    starship init fish | source
    zoxide init fish | source

    bind \cx\ce edit_command
    bind \co copy_current_command

    set PATH $PATH /home/nik/.local/bin

    set -x GTK2_RC_FILES "/usr/share/themes/Numix/gtk-2.0/gtkrc"
    set -x RUFF_EXPERIMENTAL_FORMATTER "True"
    set -x QT_QPA_PLATFORMTHEME gtk3
    set -x LANG en_US.UTF-8
    set -x GTK2_RC_FILES /usr/share/themes/Numix/gtk-2.0/gtkrc
    set -x XDG_CONFIG_HOME "$HOME/.config"
    set -x VISUAL "nvim"
    set -x EDITOR "nvim"
    set -x SUDO_EDITOR "nvim"
    set -x GPG_TTY (tty)
    set -x RANGER_DEVICONS_SEPARATOR "  "
    set -x GTK_THEME "Numix:dark"
    set -x PASSWORD_STORE_ENABLE_EXTENSIONS true

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


    alias abs='readlink -f'
    alias b=brightness
    alias bl='xrandr --output DP-0 --brightness 0.1 && xrandr --output HDMI-0 --brightness 0.1'
    alias bn='xrandr --output DP-0 --brightness 1 && xrandr --output HDMI-0 --brightness 1'

    alias cat=bat
    alias cp='cp -i'
    alias d='ripdrag -a -x'
    alias ddate='date -u +%Y-%m-%dT%H:%M:%S'
    alias duc='du -s -x -h * 2> /dev/null | sort -h -r'
    alias dud='du -d 1 -h'

    alias h=history
    alias md='mkdir -p'
    alias mv='mv -i'
    alias py=python
    alias rd=rmdir
    alias rename=perl-rename
    alias sortnr='sort -n -r'
    alias t='tail -f'
    alias to_clip='xclip -sel clip'
    alias tree='exa --tree'
    alias which-command=whence
    alias ww='ls *mkv | head -n 1 | tee $TTY | xargs -I {} mv {} {}_'
    alias x=extract


end

set ___MY_VMOPTIONS_SHELL_FILE "$HOME/.jetbrains.vmoptions.sh"
if test -f $___MY_VMOPTIONS_SHELL_FILE
    . $___MY_VMOPTIONS_SHELL_FILE
end

