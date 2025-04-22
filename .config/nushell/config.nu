
let dark_theme = {
  # color for nushell primitives
  separator: white
  leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
  header: green_bold
  empty: blue
  # Closures can be used to choose colors for specific values.
  # The value (in this case, a bool) is piped into the closure.
  # eg) {|| if $in { 'light_cyan' } else { 'light_gray' } }
  bool: light_cyan
  int: white
  filesize: cyan
  duration: white
  date: purple
  range: white
  float: white
  string: white
  nothing: white
  binary: white
  cell-path: white
  row_index: green_bold
  record: white
  list: white
  block: white
  hints: dark_gray
  search_result: { bg: red fg: white }
  shape_and: purple_bold
  shape_binary: purple_bold
  shape_block: blue_bold
  shape_bool: light_cyan
  shape_closure: green_bold
  shape_custom: green
  shape_datetime: cyan_bold
  shape_directory: cyan
  shape_external: cyan
  shape_externalarg: green_bold
  shape_external_resolved: light_yellow_bold
  shape_filepath: cyan
  shape_flag: blue_bold
  shape_float: purple_bold
  # shapes are used to change the cli syntax highlighting
  shape_garbage: { fg: white bg: red attr: b }
  shape_glob_interpolation: cyan_bold
  shape_globpattern: cyan_bold
  shape_int: purple_bold
  shape_internalcall: cyan_bold
  shape_keyword: cyan_bold
  shape_list: cyan_bold
  shape_literal: blue
  shape_match_pattern: green
  shape_matching_brackets: { attr: u }
  shape_nothing: light_cyan
  shape_operator: yellow
  shape_or: purple_bold
  shape_pipe: purple_bold
  shape_range: yellow_bold
  shape_record: cyan_bold
  shape_redirection: purple_bold
  shape_signature: green_bold
  shape_string: green
  shape_string_interpolation: cyan_bold
  shape_table: blue_bold
  shape_variable: purple
  shape_vardecl: purple
  shape_raw_string: light_purple
}


let fish_completer = {|spans|
    fish --command $"complete '--do-complete=($spans | str join ' ')'"
    | from tsv --flexible --noheaders --no-infer
    | rename value description
    | update value {
        if ($in | path exists) {$'"($in | str replace "\"" "\\\"" )"'} else {$in}
    }
}

let carapace_completer = {|spans: list<string>|
    carapace $spans.0 nushell ...$spans
    | from json
    | if ($in | default [] | where value =~ '^-.*ERR$' | is-empty) { $in } else { null }
}

# This completer will use carapace by default

let external_completer = {|spans|
    let expanded_alias = (scope aliases | where name == $spans.0 | get -i 0 | get -i expansion)

    let spans = if $expanded_alias != null {
        let parts = ($expanded_alias | split row ' ')
        $spans | skip 1 | prepend $parts
    } else {
        $spans
    }

    match $spans.0 {
        nu => $fish_completer
        git => $fish_completer
        asdf => $fish_completer
        _ => $carapace_completer
    } | do $in $spans
}


$env.PROMPT_INDICATOR = {|| "> " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| ": " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }

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


$env.config = {
  show_banner: false
  edit_mode:  'vi'
  keybindings: [
    {
      name: edit_in_nvim
      modifier: CONTROL
      keycode: Char_e
      mode: [emacs vi_normal vi_insert]
      event: [
        { send: OpenEditor }
      ]
    }
    {
      name: clear_to_start
      modifier: CONTROL
      keycode: Char_u
      mode: [emacs vi_normal vi_insert]
      event: [
        { edit: Clear }
      ]
    }
  ]
  completions: {
    case_sensitive: false # set to true to enable case-sensitive completions
    algorithm: "prefix"    # prefix or fuzzy
    sort: "smart" # "smart" (alphabetical for prefix matching, fuzzy score for fuzzy matching) or "alphabetical"
    partial: true    # set this to false to prevent partial filling of the prompt
    quick: true    # set this to false to prevent auto-selecting completions when only one remains
    external: {
      enable: true
      completer: $external_completer
    }
    use_ls_colors: true # set this to true to enable file/path/directory completions using LS_COLORS
  }
  color_config: $dark_theme
  menus: [
  ]
}

const custom_completions = ($base | path join ./modules/nu_scripts/custom-completions/)

use ($custom_completions | path join "git/git-completions.nu") *
use ($custom_completions | path join "ssh/ssh-completions.nu") *
use ($custom_completions | path join "bat/bat-completions.nu") *
use ($custom_completions | path join "gh/gh-completions.nu") *
use ($custom_completions | path join "docker/docker-completions.nu") *
use ($custom_completions | path join "uv/uv-completions.nu") *
use ($custom_completions | path join "tar/tar-completions.nu") *
use ($custom_completions | path join "pass/pass-completions.nu") *
use ($custom_completions | path join "pytest/pytest-completions.nu") *
use ($custom_completions | path join "rg/rg-completions.nu") *
use ($custom_completions | path join "pre-commit/pre-commit-completions.nu") *
use ($custom_completions | path join "eza/eza-completions.nu") *
