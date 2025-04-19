function gs --wraps gs
end
# docker.fish
if type -q docker
    function dbl --wraps docker
        docker build $argv
    end
    function dcb --wraps docker
        docker-compose build $argv
    end
    function dcdn --wraps docker
        docker-compose down $argv
    end
    function dce --wraps docker
        docker-compose exec $argv
    end
    function dcin --wraps docker
        docker container inspect $argv
    end
    function dck --wraps docker
        docker compose kill $argv
    end
    function dcl --wraps docker
        docker compose logs $argv
    end
    function dclF --wraps docker
        docker compose logs -f --tail 0 $argv
    end
    function dclf --wraps docker
        docker compose logs -f $argv
    end
    function dcls --wraps docker
        docker container ls $argv
    end
    function dclsa --wraps docker
        docker container ls -a $argv
    end
    function dco --wraps docker
        docker compose $argv
    end
    function dcps --wraps docker
        docker compose ps $argv
    end
    function dcpull --wraps docker
        docker compose pull $argv
    end
    function dcr --wraps docker
        docker compose run $argv
    end
    function dcrestart --wraps docker
        docker compose restart $argv
    end
    function dcrm --wraps docker
        docker compose rm $argv
    end
    function dcstart --wraps docker
        docker compose start $argv
    end
    function dcstop --wraps docker
        docker compose stop $argv
    end
    function dcup --wraps docker
        docker compose up $argv
    end
    function dcupb --wraps docker
        docker compose up --build $argv
    end
    function dcupd --wraps docker
        docker compose up -d $argv
    end
    function dcupdb --wraps docker
        docker compose up -d --build $argv
    end
    function dib --wraps docker
        docker image build $argv
    end
    function dii --wraps docker
        docker image inspect $argv
    end
    function dils --wraps docker
        docker image ls $argv
    end
    function dipu --wraps docker
        docker image push $argv
    end
    function dirm --wraps docker
        docker image rm $argv
    end
    function dit --wraps docker
        docker image tag $argv
    end
    function dlo --wraps docker
        docker container logs $argv
    end
    function dn --wraps docker
        dotnet new $argv
    end
    function dnc --wraps docker
        docker network create $argv
    end
    function dncn --wraps docker
        docker network connect $argv
    end
    function dndcn --wraps docker
        docker network disconnect $argv
    end
    function dng --wraps docker
        dotnet nuget $argv
    end
    function dni --wraps docker
        docker network inspect $argv
    end
    function dnls --wraps docker
        docker network ls $argv
    end
    function dnrm --wraps docker
        docker network rm $argv
    end
    function dp --wraps docker
        dotnet pack $argv
    end
    function dpo --wraps docker
        docker container port $argv
    end
    function dps --wraps docker
        docker ps $argv
    end
    function dpsa --wraps docker
        docker ps -a $argv
    end
    function dpu --wraps docker
        docker pull $argv
    end
    function dr --wraps docker
        docker container run $argv
    end
    function drit --wraps docker
        docker container run -it $argv
    end
    function drm --wraps docker
        docker container rm $argv
    end
    function 'drm!' --wraps docker
        docker container rm -f $argv
    end
    function drs --wraps docker
        docker container restart $argv
    end
    function dst --wraps docker
        docker container start $argv
    end
    function dsta --wraps docker
        docker stop (docker ps -q) $argv
    end
    function dstp --wraps docker
        docker container stop $argv
    end
    function dtop --wraps docker
        docker top $argv
    end
    function dvi --wraps docker
        docker volume inspect $argv
    end
    function dvls --wraps docker
        docker volume ls $argv
    end
    function dvprune --wraps docker
        docker volume prune $argv
    end
    function dxc --wraps docker
        docker container exec $argv
    end
    function dxcit --wraps docker
        docker container exec -it $argv
    end
end



# exa.fish
if type -q exa
    function l --wraps exa
        exa -lhF $argv
    end
    function lS --wraps exa
        exa -1SshF $argv
    end
    function la --wraps exa
        exa -lAhF $argv
    end
    function lart --wraps exa
        exa -1cartF $argv
    end
    function ldot --wraps exa
        exa -ld .* $argv
    end
    function ll --wraps exa
        exa -l $argv
    end
    function lr --wraps exa
        exa -tRhF $argv
    end
    function lrt --wraps exa
        exa -1crtF $argv
    end
    function ls --wraps exa
        ls --color=tty $argv
    end
    function lsa --wraps exa
        ls -lah $argv
    end
    function lsn --wraps exa
        exa -1 $argv
    end
    function lsr --wraps exa
        exa -lARhF $argv
    end
    function lt --wraps exa
        exa -lthF $argv
    end
end



# gh.fish
if type -q gh
    function gh-create --wraps gh
        gh repo create --public --source=. --remote=origin && git push -u --all && gh browse $argv
    end
    function gh-create-private --wraps gh
        gh repo create --private --source=. --remote=origin && git push -u --all && gh browse $argv
    end
end



# git.fish
if type -q git
    function g --wraps git
        git $argv
    end
    function ga --wraps git
        git add $argv
    end
    function gaa --wraps git
        git add --all $argv
    end
    function gam --wraps git
        git am $argv
    end
    function gama --wraps git
        git am --abort $argv
    end
    function gamc --wraps git
        git am --continue $argv
    end
    function gams --wraps git
        git am --skip $argv
    end
    function gamscp --wraps git
        git am --show-current-patch $argv
    end
    function gap --wraps git
        git apply $argv
    end
    function gapa --wraps git
        git add --patch $argv
    end
    function gapt --wraps git
        git apply --3way $argv
    end
    function gau --wraps git
        git add --update $argv
    end
    function gav --wraps git
        git add --verbose $argv
    end
    function gb --wraps git
        git branch $argv
    end
    function gbD --wraps git
        git branch --delete --force $argv
    end
    function gba --wraps git
        git branch --all $argv
    end
    function gbd --wraps git
        git branch --delete $argv
    end
    function gbl --wraps git
        git blame -w $argv
    end
    function gbm --wraps git
        git branch --move $argv
    end
    function gbnm --wraps git
        git branch --no-merged $argv
    end
    function gbr --wraps git
        git branch --remote $argv
    end
    function gbs --wraps git
        git bisect $argv
    end
    function gbsb --wraps git
        git bisect bad $argv
    end
    function gbsg --wraps git
        git bisect good $argv
    end
    function gbsn --wraps git
        git bisect new $argv
    end
    function gbso --wraps git
        git bisect old $argv
    end
    function gbsr --wraps git
        git bisect reset $argv
    end
    function gbss --wraps git
        git bisect start $argv
    end
    function gc --wraps git
        git commit --verbose $argv
    end
    function 'gc!' --wraps git
        git commit --verbose --amend $argv
    end
    function gcB --wraps git
        git checkout -B $argv
    end
    function gca --wraps git
        git commit --verbose --all $argv
    end
    function 'gca!' --wraps git
        git commit --verbose --all --amend $argv
    end
    function gcam --wraps git
        git commit --all --message $argv
    end
    function 'gcan!' --wraps git
        git commit --verbose --all --no-edit --amend $argv
    end
    function 'gcann!' --wraps git
        git commit --verbose --all --date=now --no-edit --amend $argv
    end
    function 'gcans!' --wraps git
        git commit --verbose --all --signoff --no-edit --amend $argv
    end
    function gcas --wraps git
        git commit --all --signoff $argv
    end
    function gcasm --wraps git
        git commit --all --signoff --message $argv
    end
    function gcb --wraps git
        git checkout -b $argv
    end
    function gcf --wraps git
        git config --list $argv
    end
    function gcl --wraps git
        git clone --recurse-submodules $argv
    end
    function gclean --wraps git
        git clean --interactive -d $argv
    end
    function gcmsg --wraps git
        git commit --message $argv
    end
    function 'gcn!' --wraps git
        git commit --verbose --no-edit --amend $argv
    end
    function gco --wraps git
        git checkout $argv
    end
    function gcor --wraps git
        git checkout --recurse-submodules $argv
    end
    function gcount --wraps git
        git shortlog --summary --numbered $argv
    end
    function gcp --wraps git
        git cherry-pick $argv
    end
    function gcpa --wraps git
        git cherry-pick --abort $argv
    end
    function gcpc --wraps git
        git cherry-pick --continue $argv
    end
    function gcs --wraps git
        git commit --gpg-sign $argv
    end
    function gcsm --wraps git
        git commit --signoff --message $argv
    end
    function gcss --wraps git
        git commit --gpg-sign --signoff $argv
    end
    function gcssm --wraps git
        git commit --gpg-sign --signoff --message $argv
    end
    function gd --wraps git
        git diff $argv
    end
    function gdca --wraps git
        git diff --cached $argv
    end
    function gdct --wraps git
        git describe --tags (git rev-list --tags --max-count=1) $argv
    end
    function gdcw --wraps git
        git diff --cached --word-diff $argv
    end
    function gds --wraps git
        git diff --staged $argv
    end
    function gdt --wraps git
        git diff-tree --no-commit-id --name-only -r $argv
    end
    function gdup --wraps git
        git diff @{upstream} $argv
    end
    function gdw --wraps git
        git diff --word-diff $argv
    end
    function gf --wraps git
        git fetch $argv
    end
    function gfa --wraps git
        git fetch --all --prune --jobs=10 $argv
    end
    function gfg --wraps git
        git ls-files | grep $argv
    end
    function gfo --wraps git
        git fetch origin $argv
    end
    function gg --wraps git
        git gui citool $argv
    end
    function gga --wraps git
        git gui citool --amend $argv
    end
    function ggpull --wraps git
        git pull origin "(git branch --show-current)" $argv
    end
    function ggpur --wraps git
        ggu $argv
    end
    function ggpush --wraps git
        git push origin "(git branch --show-current)" $argv
    end
    function ggsup --wraps git
        git branch --set-upstream-to=origin/(git branch --show-current) $argv
    end
    function ghh --wraps git
        git help $argv
    end
    function gi --wraps git
        git-ignore $argv
    end
    function gignore --wraps git
        git update-index --assume-unchanged $argv
    end
    function gignored --wraps git
        git ls-files -v | grep "^[[:lower:]]" $argv
    end
    function gl --wraps git
        git pull $argv
    end
    function glg --wraps git
        git log --stat $argv
    end
    function glgg --wraps git
        git log --graph $argv
    end
    function glgga --wraps git
        git log --graph --decorate --all $argv
    end
    function glgm --wraps git
        git log --graph --max-count=10 $argv
    end
    function glgp --wraps git
        git log --stat --patch $argv
    end
    function glo --wraps git
        git log --oneline --decorate $argv
    end
    function globurl --wraps git
        noglob urlglobber $argv
    end
    function glod --wraps git
        git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" $argv
    end
    function glods --wraps git
        git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short $argv
    end
    function glog --wraps git
        git log --oneline --decorate --graph $argv
    end
    function gloga --wraps git
        git log --oneline --decorate --graph --all $argv
    end
    function glol --wraps git
        git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" $argv
    end
    function glola --wraps git
        git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all $argv
    end
    function glols --wraps git
        git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat $argv
    end
    function glp --wraps git
        _git_log_prettily $argv
    end
    function gluc --wraps git
        git pull upstream (git branch --show-current) $argv
    end
    function gm --wraps git
        git merge $argv
    end
    function gma --wraps git
        git merge --abort $argv
    end
    function gmc --wraps git
        git merge --continue $argv
    end
    function gms --wraps git
        git merge --squash $argv
    end
    function gmtl --wraps git
        git mergetool --no-prompt $argv
    end
    function gmtlvim --wraps git
        git mergetool --no-prompt --tool=vimdiff $argv
    end
    function gp --wraps git
        git push $argv
    end
    function gpd --wraps git
        git push --dry-run $argv
    end
    function gpf --wraps git
        git push --force-with-lease --force-if-includes $argv
    end
    function 'gpf!' --wraps git
        git push --force $argv
    end
    function gpoat --wraps git
        git push origin --all && git push origin --tags $argv
    end
    function gpod --wraps git
        git push origin --delete $argv
    end
    function gpr --wraps git
        git pull --rebase $argv
    end
    function gpra --wraps git
        git pull --rebase --autostash $argv
    end
    function gprav --wraps git
        git pull --rebase --autostash -v $argv
    end
    function gpristine --wraps git
        git reset --hard && git clean --force -dfx $argv
    end
    function gprv --wraps git
        git pull --rebase -v $argv
    end
    function gpsup --wraps git
        git push --set-upstream origin (git branch --show-current) $argv
    end
    function gpsupf --wraps git
        git push --set-upstream origin (git branch --show-current) --force-with-lease --force-if-includes $argv
    end
    function gpu --wraps git
        git push upstream $argv
    end
    function gpv --wraps git
        git push --verbose $argv
    end
    function gr --wraps git
        git remote $argv
    end
    function gra --wraps git
        git remote add $argv
    end
    function grb --wraps git
        git rebase $argv
    end
    function grba --wraps git
        git rebase --abort $argv
    end
    function grbc --wraps git
        git rebase --continue $argv
    end
    function grbi --wraps git
        git rebase --interactive $argv
    end
    function grbo --wraps git
        git rebase --onto $argv
    end
    function grbs --wraps git
        git rebase --skip $argv
    end
    function grep --wraps git
        rg $argv
    end
    function grev --wraps git
        git revert $argv
    end
    function greva --wraps git
        git revert --abort $argv
    end
    function grevc --wraps git
        git revert --continue $argv
    end
    function grf --wraps git
        git reflog $argv
    end
    function grh --wraps git
        git reset $argv
    end
    function grhh --wraps git
        git reset --hard $argv
    end
    function grhk --wraps git
        git reset --keep $argv
    end
    function grhs --wraps git
        git reset --soft $argv
    end
    function grm --wraps git
        git rm $argv
    end
    function grmc --wraps git
        git rm --cached $argv
    end
    function grmv --wraps git
        git remote rename $argv
    end
    function groh --wraps git
        git reset origin/(git branch --show-current) --hard $argv
    end
    function grrm --wraps git
        git remote remove $argv
    end
    function grs --wraps git
        git restore $argv
    end
    function grset --wraps git
        git remote set-url $argv
    end
    function grss --wraps git
        git restore --source $argv
    end
    function grst --wraps git
        git restore --staged $argv
    end
    function grt --wraps git
        cd "(git rev-parse --show-toplevel || echo .)" $argv
    end
    function gru --wraps git
        git reset -- $argv
    end
    function grup --wraps git
        git remote update $argv
    end
    function grv --wraps git
        git remote --verbose $argv
    end
    function gsb --wraps git
        git status --short --branch $argv
    end
    function gsd --wraps git
        git svn dcommit $argv
    end
    function gsh --wraps git
        git show $argv
    end
    function gsi --wraps git
        git submodule init $argv
    end
    function gsps --wraps git
        git show --pretty=short --show-signature $argv
    end
    function gsr --wraps git
        git svn rebase $argv
    end
    function gss --wraps git
        git status --short $argv
    end
    function gst --wraps git
        git status $argv
    end
    function gsta --wraps git
        git stash push $argv
    end
    function gstaa --wraps git
        git stash apply $argv
    end
    function gstall --wraps git
        git stash --all $argv
    end
    function gstc --wraps git
        git stash clear $argv
    end
    function gstd --wraps git
        git stash drop $argv
    end
    function gstl --wraps git
        git stash list $argv
    end
    function gstp --wraps git
        git stash pop $argv
    end
    function gsts --wraps git
        git stash show --patch $argv
    end
    function gstu --wraps git
        gsta --include-untracked $argv
    end
    function gsu --wraps git
        git submodule update $argv
    end
    function gsw --wraps git
        git switch $argv
    end
    function gswc --wraps git
        git switch --create $argv
    end
    function gta --wraps git
        git tag --annotate $argv
    end
    function gtas --wraps git
        git tag --annotate --sign $argv
    end
    function gtl --description 'List git tags sorted by version' --wraps git
        git tag --sort=-v:refname -n --list "$argv[1]*" $argv
    end
    function gts --wraps git
        git tag --sign $argv
    end
    function gtv --wraps git
        git tag | sort -V $argv
    end
    function gunignore --wraps git
        git update-index --no-assume-unchanged $argv
    end
    function gunwip --wraps git
        git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1 $argv
    end
    function gwch --wraps git
        git whatchanged -p --abbrev-commit --pretty=medium $argv
    end
    function gwipe --wraps git
        git reset --hard && git clean --force -df $argv
    end
    function gwt --wraps git
        git worktree $argv
    end
    function gwta --wraps git
        git worktree add $argv
    end
    function gwtls --wraps git
        git worktree list $argv
    end
    function gwtmv --wraps git
        git worktree move $argv
    end
    function gwtrm --wraps git
        git worktree remove $argv
    end
end



# pacman.fish
if type -q pacman
    function pacfiles --wraps pacman
        pacman -F $argv
    end
    function pacfileupg --wraps pacman
        sudo pacman -Fy $argv
    end
    function pacin --wraps pacman
        sudo pacman -S $argv
    end
    function pacins --wraps pacman
        sudo pacman -U $argv
    end
    function pacinsd --wraps pacman
        sudo pacman -S --asdeps $argv
    end
    function paclean --wraps pacman
        sudo pacman -Sc $argv
    end
    function pacloc --wraps pacman
        pacman -Qi $argv
    end
    function paclocs --wraps pacman
        pacman -Qs $argv
    end
    function paclr --wraps pacman
        sudo pacman -Scc $argv
    end
    function pacls --wraps pacman
        pacman -Ql $argv
    end
    function paclsorphans --wraps pacman
        sudo pacman -Qdt $argv
    end
    function pacmanallkeys --wraps pacman
        sudo pacman-key --refresh-keys $argv
    end
    function pacmir --wraps pacman
        sudo pacman -Syy $argv
    end
    function pacown --wraps pacman
        pacman -Qo $argv
    end
    function pacre --wraps pacman
        sudo pacman -R $argv
    end
    function pacrem --wraps pacman
        sudo pacman -Rns $argv
    end
    function pacrep --wraps pacman
        pacman -Si $argv
    end
    function pacreps --wraps pacman
        pacman -Ss $argv
    end
    function pacrmorphans --wraps pacman
        sudo pacman -Rs (pacman -Qtdq) $argv
    end
    function pacupd --wraps pacman
        sudo pacman -Sy $argv
    end
    function pacupg --wraps pacman
        sudo pacman -Syu $argv
    end
end



# pre_commit.fish
if type -q pre-commit
    function prc --wraps pre-commit
        pre-commit $argv
    end
    function prcau --wraps pre-commit
        pre-commit autoupdate $argv
    end
    function prcr --wraps pre-commit
        pre-commit run $argv
    end
    function prcra --wraps pre-commit
        pre-commit run --all-files $argv
    end
    function prcrf --wraps pre-commit
        pre-commit run --files $argv
    end
end



# rsync.fish
if type -q rsync
    function rsync-copy --wraps rsync
        rsync -avz --progress -h $argv
    end
    function rsync-move --wraps rsync
        rsync -avz --progress -h --remove-source-files $argv
    end
    function rsync-synchronize --wraps rsync
        rsync -avzu --delete --progress -h $argv
    end
    function rsync-update --wraps rsync
        rsync -avzu --progress -h $argv
    end
end



# yay.fish
if type -q yay
    function yaclean --wraps yay
        yay -Sc $argv
    end
    function yaclr --wraps yay
        yay -Scc $argv
    end
    function yaconf --wraps yay
        yay -Pg $argv
    end
    function yain --wraps yay
        yay -S $argv
    end
    function yains --wraps yay
        yay -U $argv
    end
    function yainsd --wraps yay
        yay -S --asdeps $argv
    end
    function yaloc --wraps yay
        yay -Qi $argv
    end
    function yalocs --wraps yay
        yay -Qs $argv
    end
    function yalst --wraps yay
        yay -Qe $argv
    end
    function yamir --wraps yay
        yay -Syy $argv
    end
    function yaorph --wraps yay
        yay -Qtd $argv
    end
    function yare --wraps yay
        yay -R $argv
    end
    function yarem --wraps yay
        yay -Rns $argv
    end
    function yarep --wraps yay
        yay -Si $argv
    end
    function yareps --wraps yay
        yay -Ss $argv
    end
    function yasu --wraps yay
        yay -Syu --noconfirm $argv
    end
    function yaupd --wraps yay
        yay -Sy $argv
    end
    function yaupg
        yay --wraps yay -Syu $argvaps yay -Syu
    end
end
