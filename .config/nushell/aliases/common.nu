# common

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
