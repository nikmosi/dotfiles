function fish_greeting
end

set -x fish_tmux_autostart false

if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    zoxide init fish | source

    bind \cx\ce edit_command
    bind \co copy_current_command


    set -x GTK2_RC_FILES "/usr/share/themes/Numix/gtk-2.0/gtkrc"
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

    alias x='extract'

    abbr - 'z -'
    abbr --position anywhere -a ... ../..
    abbr --position anywhere -a .... ../../..
    abbr --position anywhere -a ..... ../../../..
    abbr --position anywhere -a ...... ../../../../..

    abbr -a CA --position anywhere '2>&1 | cat -A'
    abbr -a G --position anywhere '| rg'
    abbr -a H --position anywhere  '| head'
    abbr -a L --position anywhere '| less'
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

    alias dbl='docker build'
    alias dcb='docker-compose build'
    alias dcdn='docker-compose down'
    alias dce='docker-compose exec'
    alias dcin='docker container inspect'
    alias dck='docker compose kill'
    alias dcl='docker compose logs'
    alias dclF='docker compose logs -f --tail 0'
    alias dclf='docker compose logs -f'
    alias dcls='docker container ls'
    alias dclsa='docker container ls -a'
    alias dco='docker compose'
    alias dcps='docker compose ps'
    alias dcpull='docker compose pull'
    alias dcr='docker compose run'
    alias dcrestart='docker compose restart'
    alias dcrm='docker compose rm'
    alias dcstart='docker compose start'
    alias dcstop='docker compose stop'
    alias dcup='docker compose up'
    alias dcupb='docker compose up --build'
    alias dcupd='docker compose up -d'
    alias dcupdb='docker compose up -d --build'
    alias dib='docker image build'
    alias dii='docker image inspect'
    alias dils='docker image ls'
    alias dipu='docker image push'
    alias dirm='docker image rm'
    alias dit='docker image tag'
    alias dlo='docker container logs'
    alias dn='dotnet new'
    alias dnc='docker network create'
    alias dncn='docker network connect'
    alias dndcn='docker network disconnect'
    alias dng='dotnet nuget'
    alias dni='docker network inspect'
    alias dnls='docker network ls'
    alias dnrm='docker network rm'
    alias dp='dotnet pack'
    alias dpo='docker container port'
    alias dps='docker ps'
    alias dpsa='docker ps -a'
    alias dpu='docker pull'
    alias dr='docker container run'
    alias drit='docker container run -it'
    alias drm='docker container rm'
    alias 'drm!'='docker container rm -f'
    alias drs='docker container restart'
    alias dst='docker container start'
    alias dsta='docker stop $(docker ps -q)'
    alias dstp='docker container stop'
    alias dtop='docker top'
    alias dvi='docker volume inspect'
    alias dvls='docker volume ls'
    alias dvprune='docker volume prune'
    alias dxc='docker container exec'
    alias dxcit='docker container exec -it'
    alias g=git
    alias ga='git add'
    alias gaa='git add --all'
    alias gam='git am'
    alias gama='git am --abort'
    alias gamc='git am --continue'
    alias gams='git am --skip'
    alias gamscp='git am --show-current-patch'
    alias gap='git apply'
    alias gapa='git add --patch'
    alias gapt='git apply --3way'
    alias gau='git add --update'
    alias gav='git add --verbose'
    alias gb='git branch'
    alias gbD='git branch --delete --force'
    alias gba='git branch --all'
    alias gbd='git branch --delete'
    alias gbl='git blame -w'
    alias gbm='git branch --move'
    alias gbnm='git branch --no-merged'
    alias gbr='git branch --remote'
    alias gbs='git bisect'
    alias gbsb='git bisect bad'
    alias gbsg='git bisect good'
    alias gbsn='git bisect new'
    alias gbso='git bisect old'
    alias gbsr='git bisect reset'
    alias gbss='git bisect start'
    alias gc='git commit --verbose'
    alias 'gc!'='git commit --verbose --amend'
    alias gcB='git checkout -B'
    alias gca='git commit --verbose --all'
    alias 'gca!'='git commit --verbose --all --amend'
    alias gcam='git commit --all --message'
    alias 'gcan!'='git commit --verbose --all --no-edit --amend'
    alias 'gcann!'='git commit --verbose --all --date=now --no-edit --amend'
    alias 'gcans!'='git commit --verbose --all --signoff --no-edit --amend'
    alias gcas='git commit --all --signoff'
    alias gcasm='git commit --all --signoff --message'
    alias gcb='git checkout -b'
    alias gcd='git checkout $(git_develop_branch)'
    alias gcf='git config --list'
    alias gcl='git clone --recurse-submodules'
    alias gclean='git clean --interactive -d'
    alias gcm='git checkout $(git_main_branch)'
    alias gcmsg='git commit --message'
    alias 'gcn!'='git commit --verbose --no-edit --amend'
    alias gco='git checkout'
    alias gcor='git checkout --recurse-submodules'
    alias gcount='git shortlog --summary --numbered'
    alias gcp='git cherry-pick'
    alias gcpa='git cherry-pick --abort'
    alias gcpc='git cherry-pick --continue'
    alias gcs='git commit --gpg-sign'
    alias gcsm='git commit --signoff --message'
    alias gcss='git commit --gpg-sign --signoff'
    alias gcssm='git commit --gpg-sign --signoff --message'
    alias gd='git diff'
    alias gdca='git diff --cached'
    alias gdct='git describe --tags $(git rev-list --tags --max-count=1)'
    alias gdcw='git diff --cached --word-diff'
    alias gds='git diff --staged'
    alias gdt='git diff-tree --no-commit-id --name-only -r'
    alias gdup='git diff @{upstream}'
    alias gdw='git diff --word-diff'
    alias gf='git fetch'
    alias gfa='git fetch --all --prune --jobs=10'
    alias gfg='git ls-files | grep'
    alias gfo='git fetch origin'
    alias gg='git gui citool'
    alias gga='git gui citool --amend'
    alias ggpull='git pull origin "$(git_current_branch)"'
    alias ggpur=ggu
    alias ggpush='git push origin "$(git_current_branch)"'
    alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
    alias ghh='git help'
    alias gi=git-ignore
    alias gignore='git update-index --assume-unchanged'
    alias gignored='git ls-files -v | grep "^[[:lower:]]"'
    alias git-svn-dcommit-push='git svn dcommit && git push github $(git_main_branch):svntrunk'
    alias gk='\gitk --all --branches &!'
    alias gke='\gitk --all $(git log --walk-reflogs --pretty=%h) &!'
    alias gl='git pull'
    alias glg='git log --stat'
    alias glgg='git log --graph'
    alias glgga='git log --graph --decorate --all'
    alias glgm='git log --graph --max-count=10'
    alias glgp='git log --stat --patch'
    alias glo='git log --oneline --decorate'
    alias globurl='noglob urlglobber '
    alias glod='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'
    alias glods='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'
    alias glog='git log --oneline --decorate --graph'
    alias gloga='git log --oneline --decorate --graph --all'
    alias glol='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
    alias glola='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
    alias glols='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'
    alias glp=_git_log_prettily
    alias gluc='git pull upstream $(git_current_branch)'
    alias glum='git pull upstream $(git_main_branch)'
    alias gm='git merge'
    alias gma='git merge --abort'
    alias gmc='git merge --continue'
    alias gmom='git merge origin/$(git_main_branch)'
    alias gms='git merge --squash'
    alias gmtl='git mergetool --no-prompt'
    alias gmtlvim='git mergetool --no-prompt --tool=vimdiff'
    alias gmum='git merge upstream/$(git_main_branch)'
    alias gp='git push'
    alias gpd='git push --dry-run'
    alias gpf='git push --force-with-lease --force-if-includes'
    alias 'gpf!'='git push --force'
    alias gpoat='git push origin --all && git push origin --tags'
    alias gpod='git push origin --delete'
    alias gpr='git pull --rebase'
    alias gpra='git pull --rebase --autostash'
    alias gprav='git pull --rebase --autostash -v'
    alias gpristine='git reset --hard && git clean --force -dfx'
    alias gprom='git pull --rebase origin $(git_main_branch)'
    alias gpromi='git pull --rebase=interactive origin $(git_main_branch)'
    alias gprv='git pull --rebase -v'
    alias gpsup='git push --set-upstream origin $(git_current_branch)'
    alias gpsupf='git push --set-upstream origin $(git_current_branch) --force-with-lease --force-if-includes'
    alias gpu='git push upstream'
    alias gpv='git push --verbose'
    alias gr='git remote'
    alias gra='git remote add'
    alias grb='git rebase'
    alias grba='git rebase --abort'
    alias grbc='git rebase --continue'
    alias grbd='git rebase $(git_develop_branch)'
    alias grbi='git rebase --interactive'
    alias grbm='git rebase $(git_main_branch)'
    alias grbo='git rebase --onto'
    alias grbom='git rebase origin/$(git_main_branch)'
    alias grbs='git rebase --skip'
    alias grep=rg
    alias grev='git revert'
    alias greva='git revert --abort'
    alias grevc='git revert --continue'
    alias grf='git reflog'
    alias grh='git reset'
    alias grhh='git reset --hard'
    alias grhk='git reset --keep'
    alias grhs='git reset --soft'
    alias grm='git rm'
    alias grmc='git rm --cached'
    alias grmv='git remote rename'
    alias groh='git reset origin/$(git_current_branch) --hard'
    alias grrm='git remote remove'
    alias grs='git restore'
    alias grset='git remote set-url'
    alias grss='git restore --source'
    alias grst='git restore --staged'
    alias grt='cd "$(git rev-parse --show-toplevel || echo .)"'
    alias gru='git reset --'
    alias grup='git remote update'
    alias grv='git remote --verbose'
    alias gs='replaced with alias Ghostscript'
    alias gsb='git status --short --branch'
    alias gsd='git svn dcommit'
    alias gsh='git show'
    alias gsi='git submodule init'
    alias gsps='git show --pretty=short --show-signature'
    alias gsr='git svn rebase'
    alias gss='git status --short'
    alias gst='git status'
    alias gsta='git stash push'
    alias gstaa='git stash apply'
    alias gstall='git stash --all'
    alias gstc='git stash clear'
    alias gstd='git stash drop'
    alias gstl='git stash list'
    alias gstp='git stash pop'
    alias gsts='git stash show --patch'
    alias gstu='gsta --include-untracked'
    alias gsu='git submodule update'
    alias gsw='git switch'
    alias gswc='git switch --create'
    alias gswd='git switch $(git_develop_branch)'
    alias gswm='git switch $(git_main_branch)'
    alias gta='git tag --annotate'
    alias gtas='git tag --annotate --sign'
    function gtl --description 'List git tags sorted by version'
        git tag --sort=-v:refname -n --list "$argv[1]*"
    end
    alias gts='git tag --sign'
    alias gtv='git tag | sort -V'
    alias gunignore='git update-index --no-assume-unchanged'
    alias gunwip='git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1'
    alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
    alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
    alias gwipe='git reset --hard && git clean --force -df'
    alias gwt='git worktree'
    alias gwta='git worktree add'
    alias gwtls='git worktree list'
    alias gwtmv='git worktree move'
    alias gwtrm='git worktree remove'
    alias h=history
    alias l='exa -lhF'
    alias lS='exa -1SshF'
    alias la='exa -lAhF'
    alias lart='exa -1cartF'
    alias ldot='exa -ld .*'
    alias ll='exa -l'
    alias lr='exa -tRhF'
    alias lrt='exa -1crtF'
    alias ls='ls --color=tty'
    alias lsa='ls -lah'
    alias lsn='exa -1'
    alias lsr='exa -lARhF'
    alias lt='exa -lthF'
    alias md='mkdir -p'
    alias mv='mv -i'
    alias pacfiles='pacman -F'
    alias pacfileupg='sudo pacman -Fy'
    alias pacin='sudo pacman -S'
    alias pacins='sudo pacman -U'
    alias pacinsd='sudo pacman -S --asdeps'
    alias paclean='sudo pacman -Sc'
    alias pacloc='pacman -Qi'
    alias paclocs='pacman -Qs'
    alias paclr='sudo pacman -Scc'
    alias pacls='pacman -Ql'
    alias paclsorphans='sudo pacman -Qdt'
    alias pacmanallkeys='sudo pacman-key --refresh-keys'
    alias pacmir='sudo pacman -Syy'
    alias pacown='pacman -Qo'
    alias pacre='sudo pacman -R'
    alias pacrem='sudo pacman -Rns'
    alias pacrep='pacman -Si'
    alias pacreps='pacman -Ss'
    alias pacrmorphans='sudo pacman -Rs $(pacman -Qtdq)'
    alias pacupd='sudo pacman -Sy'
    alias pacupg='sudo pacman -Syu'
    alias pad='poetry add'
    alias pbld='poetry build'
    alias pch='poetry check'
    alias pcmd='poetry list'
    alias pconf='poetry config --list'
    alias pexp='poetry export --without-hashes > requirements.txt'
    alias pin='poetry init'
    alias pinst='poetry install'
    alias plck='poetry lock'
    alias pnew='poetry new'
    alias ppath='poetry env info --path'
    alias pplug='poetry self show plugins'
    alias ppub='poetry publish'
    alias prc=pre-commit
    alias prcau='pre-commit autoupdate'
    alias prcr='pre-commit run'
    alias prcra='pre-commit run --all-files'
    alias prcrf='pre-commit run --files'
    alias prm='poetry remove'
    alias prun='poetry run'
    alias psad='poetry self add'
    alias psh='poetry shell'
    alias pshw='poetry show'
    alias pslt='poetry show --latest'
    alias psup='poetry self update'
    alias psync='poetry install --sync'
    alias ptree='poetry show --tree'
    alias pup='poetry update'
    alias pvinf='poetry env info'
    alias pvoff='poetry config virtualenvs.create false'
    alias pvrm='poetry env remove'
    alias pvu='poetry env use'
    alias py=python
    alias rd=rmdir
    alias rename=perl-rename
    alias rsync-copy='rsync -avz --progress -h'
    alias rsync-move='rsync -avz --progress -h --remove-source-files'
    alias rsync-synchronize='rsync -avzu --delete --progress -h'
    alias rsync-update='rsync -avzu --progress -h'
    alias run-help=man
    alias sortnr='sort -n -r'
    alias t='tail -f'
    alias tds=_tmux_directory_session
    alias tksv='tmux kill-server'
    alias tl='tmux list-sessions'
    alias tmuxconf='$EDITOR $ZSH_TMUX_CONFIG'
    alias to_clip='xclip -sel clip'
    alias tree='exa --tree'
    alias unexport=unset
    alias v=nvim
    alias which-command=whence
    alias ww='ls *mkv | head -n 1 | tee $TTY | xargs -I {} mv {} {}_'
    alias x=extract
    alias yaclean='yay -Sc'
    alias yaclr='yay -Scc'
    alias yaconf='yay -Pg'
    alias yain='yay -S'
    alias yains='yay -U'
    alias yainsd='yay -S --asdeps'
    alias yaloc='yay -Qi'
    alias yalocs='yay -Qs'
    alias yalst='yay -Qe'
    alias yamir='yay -Syy'
    alias yaorph='yay -Qtd'
    alias yare='yay -R'
    alias yarem='yay -Rns'
    alias yarep='yay -Si'
    alias yareps='yay -Ss'
    alias yasu='yay -Syu --noconfirm'
    alias yaupd='yay -Sy'
    alias yaupg='yay -Syu'


end

set ___MY_VMOPTIONS_SHELL_FILE "$HOME/.jetbrains.vmoptions.sh"
if test -f $___MY_VMOPTIONS_SHELL_FILE
    . $___MY_VMOPTIONS_SHELL_FILE
end

