# common

def --env r [...args] {
  let tmp = (mktemp -t "yazi-cwd.XXXXXX")
  yazi ...$args --cwd-file $tmp
  let cwd = (open $tmp)
  if $cwd != "" and $cwd != $env.PWD {
    cd $cwd
  }
  rm -fp $tmp
}

def vf [] {
  nvim (fd | fzf)
}

def --env take [dir: string] {
  mkdir $dir; cd $dir
}

def copy [file: string] {
  cat $file | to_clip
}

def t [] {
  sesh connect .
}

def tp [] {
  sesh connect (
    sesh list --icons | fzf
    --no-sort --ansi --border-label ' sesh ' --prompt '⚡  '
    --header '  ^a all ^t tmux ^g configs ^x zoxide ^d tmux kill ^f find'
    --bind 'tab:down,btab:up'
    --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list --icons)'
    --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t --icons)'
    --bind 'ctrl-g:change-prompt(⚙️  )+reload(sesh list -c --icons)'
    --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z --icons)'
    --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)'
    --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)'
    --preview-window 'right:55%'
    --preview 'sesh preview {}'
  )
}

def complete_uv [] {
  use ($custom_completions | path join "uv/uv-completions.nu") *
}

def expand_alias [a: string@complete_alias] {
  scope aliases | where name == $a
}

def complete_alias [] {
  {
    completions: (
      scope aliases | each {|line|
        {
          value: ($line | get name)
          description: ($line | get expansion)
        }
      }
    )
  }
}

alias v = nvim
alias se = sudoedit
alias swo = nh os switch
alias upd = nh os switch --update
alias hms = nh home switch

alias startwine = env ($env.HOME | path join .local/share/StartWine/data/runtime/sw)
alias abs = readlink -f
alias cat = bat
alias d = ripdrag -a -x
alias md = mkdir
alias rd = rmdir
alias py = python
alias prename = perl-rename
alias grep = rg
alias sortnr = sort -n -r
alias tt = tail -f
alias to_clip = xclip -sel clip
alias x = extract
