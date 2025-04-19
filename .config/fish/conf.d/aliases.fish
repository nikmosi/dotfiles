function gs
end
# docker.fish
if type -q docker
    function dbl
        docker build
    end
    function dcb
        docker-compose build
    end
    function dcdn
        docker-compose down
    end
    function dce
        docker-compose exec
    end
    function dcin
        docker container inspect
    end
    function dck
        docker compose kill
    end
    function dcl
        docker compose logs
    end
    function dclF
        docker compose logs -f --tail 0
    end
    function dclf
        docker compose logs -f
    end
    function dcls
        docker container ls
    end
    function dclsa
        docker container ls -a
    end
    function dco
        docker compose
    end
    function dcps
        docker compose ps
    end
    function dcpull
        docker compose pull
    end
    function dcr
        docker compose run
    end
    function dcrestart
        docker compose restart
    end
    function dcrm
        docker compose rm
    end
    function dcstart
        docker compose start
    end
    function dcstop
        docker compose stop
    end
    function dcup
        docker compose up
    end
    function dcupb
        docker compose up --build
    end
    function dcupd
        docker compose up -d
    end
    function dcupdb
        docker compose up -d --build
    end
    function dib
        docker image build
    end
    function dii
        docker image inspect
    end
    function dils
        docker image ls
    end
    function dipu
        docker image push
    end
    function dirm
        docker image rm
    end
    function dit
        docker image tag
    end
    function dlo
        docker container logs
    end
    function dn
        dotnet new
    end
    function dnc
        docker network create
    end
    function dncn
        docker network connect
    end
    function dndcn
        docker network disconnect
    end
    function dng
        dotnet nuget
    end
    function dni
        docker network inspect
    end
    function dnls
        docker network ls
    end
    function dnrm
        docker network rm
    end
    function dp
        dotnet pack
    end
    function dpo
        docker container port
    end
    function dps
        docker ps
    end
    function dpsa
        docker ps -a
    end
    function dpu
        docker pull
    end
    function dr
        docker container run
    end
    function drit
        docker container run -it
    end
    function drm
        docker container rm
    end
    function 'drm!'
        docker container rm -f
    end
    function drs
        docker container restart
    end
    function dst
        docker container start
    end
    function dsta
        docker stop (docker ps -q)
    end
    function dstp
        docker container stop
    end
    function dtop
        docker top
    end
    function dvi
        docker volume inspect
    end
    function dvls
        docker volume ls
    end
    function dvprune
        docker volume prune
    end
    function dxc
        docker container exec
    end
    function dxcit
        docker container exec -it
    end
end



# exa.fish
if type -q exa
    function l
        exa -lhF
    end
    function lS
        exa -1SshF
    end
    function la
        exa -lAhF
    end
    function lart
        exa -1cartF
    end
    function ldot
        exa -ld .*
    end
    function ll
        exa -l
    end
    function lr
        exa -tRhF
    end
    function lrt
        exa -1crtF
    end
    function ls
        ls --color=tty
    end
    function lsa
        ls -lah
    end
    function lsn
        exa -1
    end
    function lsr
        exa -lARhF
    end
    function lt
        exa -lthF
    end
end



# gh.fish
if type -q gh
    function gh-create
        gh repo create --public --source=. --remote=origin && git push -u --all && gh browse
    end
    function gh-create-private
        gh repo create --private --source=. --remote=origin && git push -u --all && gh browse
    end
end



# git.fish
if type -q git
    function g
        git
    end
    function ga
        git add
    end
    function gaa
        git add --all
    end
    function gam
        git am
    end
    function gama
        git am --abort
    end
    function gamc
        git am --continue
    end
    function gams
        git am --skip
    end
    function gamscp
        git am --show-current-patch
    end
    function gap
        git apply
    end
    function gapa
        git add --patch
    end
    function gapt
        git apply --3way
    end
    function gau
        git add --update
    end
    function gav
        git add --verbose
    end
    function gb
        git branch
    end
    function gbD
        git branch --delete --force
    end
    function gba
        git branch --all
    end
    function gbd
        git branch --delete
    end
    function gbl
        git blame -w
    end
    function gbm
        git branch --move
    end
    function gbnm
        git branch --no-merged
    end
    function gbr
        git branch --remote
    end
    function gbs
        git bisect
    end
    function gbsb
        git bisect bad
    end
    function gbsg
        git bisect good
    end
    function gbsn
        git bisect new
    end
    function gbso
        git bisect old
    end
    function gbsr
        git bisect reset
    end
    function gbss
        git bisect start
    end
    function gc
        git commit --verbose
    end
    function 'gc!'
        git commit --verbose --amend
    end
    function gcB
        git checkout -B
    end
    function gca
        git commit --verbose --all
    end
    function 'gca!'
        git commit --verbose --all --amend
    end
    function gcam
        git commit --all --message
    end
    function 'gcan!'
        git commit --verbose --all --no-edit --amend
    end
    function 'gcann!'
        git commit --verbose --all --date=now --no-edit --amend
    end
    function 'gcans!'
        git commit --verbose --all --signoff --no-edit --amend
    end
    function gcas
        git commit --all --signoff
    end
    function gcasm
        git commit --all --signoff --message
    end
    function gcb
        git checkout -b
    end
    function gcf
        git config --list
    end
    function gcl
        git clone --recurse-submodules
    end
    function gclean
        git clean --interactive -d
    end
    function gcmsg
        git commit --message
    end
    function 'gcn!'
        git commit --verbose --no-edit --amend
    end
    function gco
        git checkout
    end
    function gcor
        git checkout --recurse-submodules
    end
    function gcount
        git shortlog --summary --numbered
    end
    function gcp
        git cherry-pick
    end
    function gcpa
        git cherry-pick --abort
    end
    function gcpc
        git cherry-pick --continue
    end
    function gcs
        git commit --gpg-sign
    end
    function gcsm
        git commit --signoff --message
    end
    function gcss
        git commit --gpg-sign --signoff
    end
    function gcssm
        git commit --gpg-sign --signoff --message
    end
    function gd
        git diff
    end
    function gdca
        git diff --cached
    end
    function gdct
        git describe --tags (git rev-list --tags --max-count=1)
    end
    function gdcw
        git diff --cached --word-diff
    end
    function gds
        git diff --staged
    end
    function gdt
        git diff-tree --no-commit-id --name-only -r
    end
    function gdup
        git diff @{upstream}
    end
    function gdw
        git diff --word-diff
    end
    function gf
        git fetch
    end
    function gfa
        git fetch --all --prune --jobs=10
    end
    function gfg
        git ls-files | grep
    end
    function gfo
        git fetch origin
    end
    function gg
        git gui citool
    end
    function gga
        git gui citool --amend
    end
    function ggpull
        git pull origin "(git branch --show-current)"
    end
    function ggpur
        ggu
    end
    function ggpush
        git push origin "(git branch --show-current)"
    end
    function ggsup
        git branch --set-upstream-to=origin/(git branch --show-current)
    end
    function ghh
        git help
    end
    function gi
        git-ignore
    end
    function gignore
        git update-index --assume-unchanged
    end
    function gignored
        git ls-files -v | grep "^[[:lower:]]"
    end
    function gl
        git pull
    end
    function glg
        git log --stat
    end
    function glgg
        git log --graph
    end
    function glgga
        git log --graph --decorate --all
    end
    function glgm
        git log --graph --max-count=10
    end
    function glgp
        git log --stat --patch
    end
    function glo
        git log --oneline --decorate
    end
    function globurl
        noglob urlglobber
    end
    function glod
        git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"
    end
    function glods
        git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short
    end
    function glog
        git log --oneline --decorate --graph
    end
    function gloga
        git log --oneline --decorate --graph --all
    end
    function glol
        git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"
    end
    function glola
        git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all
    end
    function glols
        git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat
    end
    function glp
        _git_log_prettily
    end
    function gluc
        git pull upstream (git branch --show-current)
    end
    function gm
        git merge
    end
    function gma
        git merge --abort
    end
    function gmc
        git merge --continue
    end
    function gms
        git merge --squash
    end
    function gmtl
        git mergetool --no-prompt
    end
    function gmtlvim
        git mergetool --no-prompt --tool=vimdiff
    end
    function gp
        git push
    end
    function gpd
        git push --dry-run
    end
    function gpf
        git push --force-with-lease --force-if-includes
    end
    function 'gpf!'
        git push --force
    end
    function gpoat
        git push origin --all && git push origin --tags
    end
    function gpod
        git push origin --delete
    end
    function gpr
        git pull --rebase
    end
    function gpra
        git pull --rebase --autostash
    end
    function gprav
        git pull --rebase --autostash -v
    end
    function gpristine
        git reset --hard && git clean --force -dfx
    end
    function gprv
        git pull --rebase -v
    end
    function gpsup
        git push --set-upstream origin (git branch --show-current)
    end
    function gpsupf
        git push --set-upstream origin (git branch --show-current) --force-with-lease --force-if-includes
    end
    function gpu
        git push upstream
    end
    function gpv
        git push --verbose
    end
    function gr
        git remote
    end
    function gra
        git remote add
    end
    function grb
        git rebase
    end
    function grba
        git rebase --abort
    end
    function grbc
        git rebase --continue
    end
    function grbi
        git rebase --interactive
    end
    function grbo
        git rebase --onto
    end
    function grbs
        git rebase --skip
    end
    function grep
        rg
    end
    function grev
        git revert
    end
    function greva
        git revert --abort
    end
    function grevc
        git revert --continue
    end
    function grf
        git reflog
    end
    function grh
        git reset
    end
    function grhh
        git reset --hard
    end
    function grhk
        git reset --keep
    end
    function grhs
        git reset --soft
    end
    function grm
        git rm
    end
    function grmc
        git rm --cached
    end
    function grmv
        git remote rename
    end
    function groh
        git reset origin/(git branch --show-current) --hard
    end
    function grrm
        git remote remove
    end
    function grs
        git restore
    end
    function grset
        git remote set-url
    end
    function grss
        git restore --source
    end
    function grst
        git restore --staged
    end
    function grt
        cd "(git rev-parse --show-toplevel || echo .)"
    end
    function gru
        git reset --
    end
    function grup
        git remote update
    end
    function grv
        git remote --verbose
    end
    function gsb
        git status --short --branch
    end
    function gsd
        git svn dcommit
    end
    function gsh
        git show
    end
    function gsi
        git submodule init
    end
    function gsps
        git show --pretty=short --show-signature
    end
    function gsr
        git svn rebase
    end
    function gss
        git status --short
    end
    function gst
        git status
    end
    function gsta
        git stash push
    end
    function gstaa
        git stash apply
    end
    function gstall
        git stash --all
    end
    function gstc
        git stash clear
    end
    function gstd
        git stash drop
    end
    function gstl
        git stash list
    end
    function gstp
        git stash pop
    end
    function gsts
        git stash show --patch
    end
    function gstu
        gsta --include-untracked
    end
    function gsu
        git submodule update
    end
    function gsw
        git switch
    end
    function gswc
        git switch --create
    end
    function gta
        git tag --annotate
    end
    function gtas
        git tag --annotate --sign
    end
    function gtl --description 'List git tags sorted by version'
        git tag --sort=-v:refname -n --list "$argv[1]*"
    end
    function gts
        git tag --sign
    end
    function gtv
        git tag | sort -V
    end
    function gunignore
        git update-index --no-assume-unchanged
    end
    function gunwip
        git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1
    end
    function gwch
        git whatchanged -p --abbrev-commit --pretty=medium
    end
    function gwipe
        git reset --hard && git clean --force -df
    end
    function gwt
        git worktree
    end
    function gwta
        git worktree add
    end
    function gwtls
        git worktree list
    end
    function gwtmv
        git worktree move
    end
    function gwtrm
        git worktree remove
    end
end



# pacman.fish
if type -q pacman
    function pacfiles
        pacman -F
    end
    function pacfileupg
        sudo pacman -Fy
    end
    function pacin
        sudo pacman -S
    end
    function pacins
        sudo pacman -U
    end
    function pacinsd
        sudo pacman -S --asdeps
    end
    function paclean
        sudo pacman -Sc
    end
    function pacloc
        pacman -Qi
    end
    function paclocs
        pacman -Qs
    end
    function paclr
        sudo pacman -Scc
    end
    function pacls
        pacman -Ql
    end
    function paclsorphans
        sudo pacman -Qdt
    end
    function pacmanallkeys
        sudo pacman-key --refresh-keys
    end
    function pacmir
        sudo pacman -Syy
    end
    function pacown
        pacman -Qo
    end
    function pacre
        sudo pacman -R
    end
    function pacrem
        sudo pacman -Rns
    end
    function pacrep
        pacman -Si
    end
    function pacreps
        pacman -Ss
    end
    function pacrmorphans
        sudo pacman -Rs (pacman -Qtdq)
    end
    function pacupd
        sudo pacman -Sy
    end
    function pacupg
        sudo pacman -Syu
    end
end



# pre_commit.fish
if type -q pre-commit
    function prc
        pre-commit
    end
    function prcau
        pre-commit autoupdate
    end
    function prcr
        pre-commit run
    end
    function prcra
        pre-commit run --all-files
    end
    function prcrf
        pre-commit run --files
    end
end



# rsync.fish
if type -q rsync
    function rsync-copy
        rsync -avz --progress -h
    end
    function rsync-move
        rsync -avz --progress -h --remove-source-files
    end
    function rsync-synchronize
        rsync -avzu --delete --progress -h
    end
    function rsync-update
        rsync -avzu --progress -h
    end
end



# yay.fish
if type -q yay
    function yaclean
        yay -Sc
    end
    function yaclr
        yay -Scc
    end
    function yaconf
        yay -Pg
    end
    function yain
        yay -S
    end
    function yains
        yay -U
    end
    function yainsd
        yay -S --asdeps
    end
    function yaloc
        yay -Qi
    end
    function yalocs
        yay -Qs
    end
    function yalst
        yay -Qe
    end
    function yamir
        yay -Syy
    end
    function yaorph
        yay -Qtd
    end
    function yare
        yay -R
    end
    function yarem
        yay -Rns
    end
    function yarep
        yay -Si
    end
    function yareps
        yay -Ss
    end
    function yasu
        yay -Syu --noconfirm
    end
    function yaupd
        yay -Sy
    end
    function yaupg
        yay -Syu
    end
end
