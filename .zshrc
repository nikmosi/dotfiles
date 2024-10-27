USE_POWERLINE="true"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="zshfish"

plugins=(git archlinux zsh-syntax-highlighting copybuffer copyfile copypath cp dotnet extract fzf git-extras gitfast pass pep8 postgres rsync themes transfer poetry pre-commit docker docker-compose tmux)

source $ZSH/oh-my-zsh.sh

alias gs="replaced with alias Ghostscript"
alias gi="git-ignore"
alias tree="exa --tree"
alias ww="ls *mkv | head -n 1 | tee \$TTY | xargs -I {} mv {} {}_"
alias gtas='git tag --annotate --sign'
alias rename='perl-rename'
alias b='brightness'
alias bl='xrandr --output DP-0 --brightness 0.1 && xrandr --output HDMI-0 --brightness 0.1'
alias bn='xrandr --output DP-0 --brightness 1 && xrandr --output HDMI-0 --brightness 1'
alias to_clip='xclip -sel clip'
alias v="nvim"
alias cat="bat"
alias grep="rg"
alias duc="du -s -x -h * 2> /dev/null | sort -h -r"
alias ddate="date -u +%Y-%m-%dT%H:%M:%S"
alias abs="readlink -f"
alias py="python"
alias d="ripdrag -a -x"
alias mv="mv -i"
alias cp="cp -i"

# ls, the common ones I use a lot shortened for rapid fire usage
alias l='exa -lhF'     #size,show type,human readable
alias la='exa -lAhF'   #long list,show almost all,show type,human readable
alias lr='exa -tRhF'   #sorted by date,recursive,show type,human readable
alias lt='exa -lthF'   #long list,sorted by date,show type,human readable
alias ll='exa -l'      #long list
alias ldot='exa -ld .*'
alias lS='exa -1SshF'
alias lart='exa -1cartF'
alias lrt='exa -1crtF'
alias lsr='exa -lARhF' #Recursive list of files and directories
alias lsn='exa -1'     #A column contains name of files and directories

alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file

alias t='tail -f'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| rg'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h'

alias h='history'
alias sortnr='sort -n -r'
alias unexport='unset'


NB_CORES=$(grep -c '^processor' /proc/cpuinfo)
export MAKEFLAGS="-j$((NB_CORES+1)) -l${NB_CORES}"

export GTK2_RC_FILES="/usr/share/themes/Numix/gtk-2.0/gtkrc"
export QT_QPA_PLATFORMTHEME=gtk3
export LANG=en_US.UTF-8
export GTK2_RC_FILES=/usr/share/themes/Numix/gtk-2.0/gtkrc
export XDG_CONFIG_HOME="$HOME/.config"
export VISUAL="nvim"
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export GPG_TTY=$(tty)
export RANGER_DEVICONS_SEPARATOR="  "
export GTK_THEME=Numix:dark 
export PASSWORD_STORE_ENABLE_EXTENSIONS=true

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

transfer(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n  transfer <file|directory>\n  ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;}

brightness()
{
  brih=$1
  if [ -z "$1" ]; then
    brih="10"
  fi
  brih=$(awk '$0<1{$0=1}$0>5{$0=10}1' <<< "$brih")
  bbb=$(bc <<< "scale=2; $brih/10")
  for i in $(xrandr G \ connected | cut -f1 -d' ') ;
  do
    xrandr --output $i --brightness "$bbb"
  done
}

#DONE
create_runner_poetry()
{
  if [ -z $1 ]; then
    echo "don't specify run file" 1>&2
    return
  fi
  echo "$(poetry env info --executable) $(readlink -f $1) \"\$@\"" >> runner.sh
  chmod +x runner.sh
}

#DONE
create_pyright_config_venv()
{
  jq \
      --null-input \
      --arg venv "$(basename $(poetry env info -p))" \
      --arg venvPath "$(dirname $(poetry env info -p))" \
      '{ "venv": $venv, "venvPath": $venvPath }' \
      > pyrightconfig.json
}

#DONE
fcd ()
{
  cd "$(fd --type d | fzf)"
}

#DONE
fopen()
{
  xdg-open "$(fd --type f | fzf)"
}

bak()
{
  local file_name=$1 new_file_name="${1}.bak"
  if [ -z $file_name ]; then
    exit 1;
  fi
  
  while [ -e $new_file_name ]; do
    new_file_name="${new_file_name}.bak";
  done
  cp -r $file_name $new_file_name
}

unbak()
{
  local file_name=$1 
  if [ -z $file_name ]; then
    exit 1;
  fi
  local new_name=$(echo "$file_name" | sed -E 's/(.*).bak/\1/')
  mv -i $file_name $new_name
}

___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
