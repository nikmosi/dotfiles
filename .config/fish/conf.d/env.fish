set fish_greeting
bass source ~/.nix-profile/etc/profile.d/hm-session-vars.sh

set -x fish_tmux_autostart false
set -x fish_tmux_autostart_once false
set -x fish_tmux_autoname_session true
set -x fish_tmux_config "$HOME/.config/tmux/tmux.conf"

if status is-interactive
    set PATH $PATH /home/nik/.local/bin
    set PATH $PATH (realpath (dirname (status --current-filename))/../repo_plugin/git-fuzzy/bin)

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

end

set ___MY_VMOPTIONS_SHELL_FILE "$HOME/.jetbrains.vmoptions.sh"
if test -f $___MY_VMOPTIONS_SHELL_FILE
    . $___MY_VMOPTIONS_SHELL_FILE
end
