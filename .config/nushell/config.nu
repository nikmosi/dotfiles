$env.config = {
     keybindings: [
        {
            name: asdfdsaf
            modifier: CONTROL
            keycode: Char_e
            mode: [emacs vi_normal vi_insert]
            event: [
            { send: OpenEditor }
            ]
        }
    ]
}

const base = ($nu.config-path | path dirname)
const allias_dir = ($base | path join "aliases")

const $alias_all_file = ($base | path join "all_alias.nu")
source $alias_all_file

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
zoxide init nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")


$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ($nu.cache-dir | path join "carapace")
carapace _carapace nushell | save --force ($nu.cache-dir | path join "carapace/init.nu")

source ($nu.cache-dir | path join "carapace/init.nu")

def --env take [dir: string] {
  md $dir; cd $dir
}

def update_alias [] {
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
