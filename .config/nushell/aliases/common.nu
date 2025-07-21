# common

alias r = ^yazi
alias man = ^batman

def vf [] {
  nvim (fd | fzf)
}

def --env take [dir: string] {
  mkdir $dir; cd $dir
}

def update_alias [] {
  const config_dir = ($nu.config-path | path dirname)
  const allias_dir = ($config_dir | path join "aliases")

  let alias_all_file =  ($config_dir | path join "all_alias.nu")
  fd '\.nu' $allias_dir --absolute-path | split row "\n" | each {|s| 'source ' ++ $s} | save -f $alias_all_file
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

def comlete_uv [] {
  use ($custom_completions | path join "uv/uv-completions.nu") *
}



def expand_alias [a: string@comlete_alias] {
  scope aliases | where name == $a
}

def comlete_alias [] {
  {
    completions: (scope aliases |
    each { |line|
      {
        value: ($line | get name)
        description: ($line | get expansion)
      }
    })
  }
}

alias v = nvim
alias se = sudoedit
alias swo = nh os switch
alias upd = nh os switch --update
alias hms = nh home switch

alias startwine = env '/home/nik/.local/share/StartWine/data/runtime/sw'
alias abs = readlink -f
alias cat = bat
alias d = ripdrag -a -x
alias md = mkdir
alias rd = rmdir
alias py = python
alias prename = perl-rename
alias sortnr = sort -n -r
alias tt = tail -f
alias to_clip = xclip -sel clip
alias x = extract
