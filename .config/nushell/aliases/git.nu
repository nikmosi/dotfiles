# git
def git_add [...files: string@complete_git_files
--patch (-p) # --patch
] {
  let args = [] | append (if $patch {'--patch'} else {[]})
  if ($files | is-empty) {
    git add ...$args .
  } else {
    git add ...$args ...$files
  }
}

def git_diff [...files: string@complete_git_files] {
    git diff ...$files
}

def complete_git_files [] {
  {
    options: {
      case_sensitive: false,
      positional: false,
      sort: false,
      algorithm: "fuzzy"    # prefix or fuzzy
    },
    completions: (^git status --short | lines | where ($it | str length) > 3 |
      each { |line|
        {
          value: ($line | str substring 3..)
          description: ($line | str substring 0..2 | str replace ' ' '.')
        }
      }
    )
  }
}

alias g = git
alias ga = git_add
alias gaa = git add --all
alias gam = git am
alias gama = git am --abort
alias gamc = git am --continue
alias gams = git am --skip
alias gamscp = git am --show-current-patch
alias gap = git apply
alias gapa = git add --patch
alias gapt = git apply --3way
alias gau = git add --update
alias gav = git add --verbose
alias gb = git branch
alias gbD = git branch --delete --force
alias gba = git branch --all
alias gbd = git branch --delete
alias gbl = git blame -w
alias gbm = git branch --move
alias gbnm = git branch --no-merged
alias gbr = git branch --remote
alias gbs = git bisect
alias gbsb = git bisect bad
alias gbsg = git bisect good
alias gbsn = git bisect new
alias gbso = git bisect old
alias gbsr = git bisect reset
alias gbss = git bisect start
alias gc = git commit --verbose
alias gc! = git commit --verbose --amend
alias gcB = git checkout -B
alias gca = git commit --verbose --all
alias gca! = git commit --verbose --all --amend
alias gcam = git commit --all --message
alias gcan! = git commit --verbose --all --no-edit --amend
alias gcann! = git commit --verbose --all --date=now --no-edit --amend
alias gcans! = git commit --verbose --all --signoff --no-edit --amend
alias gcas = git commit --all --signoff
alias gcasm = git commit --all --signoff --message
alias gcb = git checkout -b
alias gcf = git config --list
alias gcl = git clone --recurse-submodules
alias gclean = git clean --interactive -d
alias gcmsg = git commit --message
alias gcn! = git commit --verbose --no-edit --amend
alias gco = git checkout
alias gcor = git checkout --recurse-submodules
alias gcount = git shortlog --summary --numbered
alias gcp = git cherry-pick
alias gcpa = git cherry-pick --abort
alias gcpc = git cherry-pick --continue
alias gcs = git commit --gpg-sign
alias gcsm = git commit --signoff --message
alias gcss = git commit --gpg-sign --signoff
alias gcssm = git commit --gpg-sign --signoff --message
alias gd = git_diff
alias gdca = git diff --cached
alias gdct = git describe --tags (git rev-list --tags --max-count=1)
alias gdcw = git diff --cached --word-diff
alias gds = git diff --staged
alias gdt = git diff-tree --no-commit-id --name-only -r
alias gdup = git diff @{upstream}
alias gdw = git diff --word-diff
alias gf = git fetch
alias gfa = git fetch --all --prune --jobs=10
alias gfg = git ls-files | grep
alias gfo = git fetch origin
alias gg = git gui citool
alias gga! = git gui citool --amend
alias ggpull = git pull origin "(git branch --show-current)"
alias ggpur = ggu
alias ggpush = git push origin "(git branch --show-current)"
alias ggsup = git branch --set-upstream-to=origin/(git branch --show-current)
alias ghh = git help
alias gi = git-ignore
alias gignore = git update-index --assume-unchanged
alias gignored = git ls-files -v | rg "^[[:lower:]]"
alias gl = git pull
alias glg = git log --stat
alias glgg = git log --graph
alias glgga = git log --graph --decorate --all
alias glgm = git log --graph --max-count=10
alias glgp = git log --stat --patch
alias glo = git log --oneline --decorate
alias globurl = noglob urlglobber
alias glod = git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"
alias glods = git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short
alias glog = git log --oneline --decorate --graph
alias gloga = git log --oneline --decorate --graph --all
alias glol = git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"
alias glola = git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all
alias glols = git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat
alias glp = _git_log_prettily
alias gluc = git pull upstream (git branch --show-current)
alias gm = git merge
alias gma = git merge --abort
alias gmc = git merge --continue
alias gms = git merge --squash
alias gmtl = git mergetool --no-prompt
alias gmtlvim = git mergetool --no-prompt --tool=vimdiff
alias gp = git push
alias gpd = git push --dry-run
alias gpf = git push --force-with-lease --force-if-includes
alias 'gpf!' = git push --force
alias gpoat = git push origin --all and git push origin --tags
alias gpod = git push origin --delete
alias gpr = git pull --rebase
alias gpra = git pull --rebase --autostash
alias gprav = git pull --rebase --autostash -v
alias gpristine = git reset --hard and git clean --force -dfx
alias gprv = git pull --rebase -v
alias gpsup = git push --set-upstream origin (git branch --show-current)
alias gpsupf = git push --set-upstream origin (git branch --show-current) --force-with-lease --force-if-includes
alias gpu = git push upstream
alias gpv = git push --verbose
alias gr = git remote
alias gra = git remote add
alias grb = git rebase
alias grba = git rebase --abort
alias grbc = git rebase --continue
alias grbi = git rebase --interactive
alias grbo = git rebase --onto
alias grbs = git rebase --skip
alias grep = rg
alias grev = git revert
alias greva = git revert --abort
alias grevc = git revert --continue
alias grf = git reflog
alias grh = git reset
alias grhh = git reset --hard
alias grhk = git reset --keep
alias grhs = git reset --soft
alias grm = git rm
alias grmc = git rm --cached
alias grmv = git remote rename
alias groh = git reset origin/(git branch --show-current) --hard
alias grrm = git remote remove
alias grs = git restore
alias grset = git remote set-url
alias grss = git restore --source
alias grst = git restore --staged
alias grt = cd (git rev-parse --show-toplevel or echo .)
alias gru = git reset --
alias grup = git remote update
alias grv = git remote --verbose
alias gsb = git status --short --branch
alias gsd = git svn dcommit
alias gsh = git show
alias gsi = git submodule init
alias gsps = git show --pretty=short --show-signature
alias gsr = git svn rebase
alias gss = git status --short
alias gst = git status
alias gsta = git stash push
alias gstaa = git stash apply
alias gstall = git stash --all
alias gstc = git stash clear
alias gstd = git stash drop
alias gstl = git stash list
alias gstp = git stash pop
alias gsts = git stash show --patch
alias gstu = gsta --include-untracked
alias gsu = git submodule update
alias gsw = git switch
alias gswc = git switch --create
alias gta = git tag --annotate
alias gtas = git tag --annotate --sign
alias gtl = git tag --sort=-v:refname -n --list
alias gts = git tag --sign
alias gtv = git tag | sort -V
alias gunignore = git update-index --no-assume-unchanged
alias gunwip = git rev-list --max-count=1 --format="%s" HEAD | rg -q "--wip--" and git reset HEAD~1
alias gwch = git whatchanged -p --abbrev-commit --pretty=medium
alias gwipe = git reset --hard and git clean --force -df
alias gwt = git worktree
alias gwta = git worktree add
alias gwtls = git worktree list
alias gwtmv = git worktree move
alias gwtrm = git worktree remove
