const config_dir = ($nu.config-path | path dirname)
const custom_completions = ($config_dir | path join ./modules/nu_scripts/custom-completions/)
const module_nu_scripts = ($config_dir | path join ./modules/nu_scripts/)

source ($config_dir | path join "all_alias.nu")
source ($config_dir | path join "colors.nu")

const cache_dir = $nu.cache-dir
const carapace_dir = ($cache_dir | path join "carapace")
const carapace_init = ($carapace_dir | path join "init.nu")
mkdir $carapace_dir
if not ($carapace_init | path exists) {
    carapace _carapace nushell | save --force $carapace_init
}
source $carapace_init

const atuin_dir = ($cache_dir | path join "atuin")
const atuin_init = ($atuin_dir | path join "init.nu")
mkdir $atuin_dir
if not ($atuin_init | path exists) {
    atuin init nu | save --force $atuin_init
}
# source $atuin_init

# Starship
const starship_dir = ($cache_dir | path join "starship")
const starship_init = ($starship_dir | path join "init.nu")
mkdir $starship_dir
if not ($starship_init | path exists) {
    starship init nu | save --force $starship_init
}
source $starship_init

# zoxide
const zoxide_dir = ($cache_dir | path join "zoxide")
const zoxide_init = ($zoxide_dir | path join "init.nu")
mkdir $zoxide_dir
if not ($zoxide_init | path exists) {
    zoxide init nushell | save --force $zoxide_init
}
source $zoxide_init

let fish_completer = {|spans|
    fish --command $"complete '--do-complete=($spans | str join ' ')'"
    | from tsv --flexible --noheaders --no-infer
    | rename value description
    | update value {
        if ($in | path exists) {
            $in
            | str replace -a ' ' '\ '
            | str replace -a '"' '\\"'
        } else {
            $in
        }
    }
}

let carapace_completer = {|spans: list<string>|

    let raw = ( carapace $spans.0 nushell ...$spans | from json )

    let completions = (
        if ($raw | get value | into string | where $it =~ '^-.*ERR$' | is-empty) {
            $raw
        } else {
            []
        }
    )

    let completions_flat = (
        $completions
        | each {|item|
            {
                value: $item.value,
                description: ($item | get -o description | default ""),
                display: $item.display,
                style: ($item | get -o style | default blue),
            }
        }
    )

    $completions_flat
}

# This completer will use carapace by default
let external_completer = {|spans|
    let expanded_alias = (scope aliases | where name == $spans.0 | get -o 0 | get -o expansion | default null)

    let spans = if $expanded_alias != null {
        let parts = ($expanded_alias | split row ' ' | get -o 0)
        $spans | skip 1 | prepend $parts
    } else {
        $spans
    }

    let completer = match $spans.0 {
        nu => $fish_completer
        lima => $fish_completer
        nh => $fish_completer
        alembic => $fish_completer
        ssh => $fish_completer
        limactl => $fish_completer
        _ => $carapace_completer
    }

    do $completer $spans
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
    {
      name: reload_config
      modifier: none
      keycode: f5
      mode: [emacs vi_normal vi_insert]
      event: {
        send: executehostcommand,
        cmd: $"source '($nu.env-path)';source '($nu.config-path)'"
      }
    }
    # {
    #   name: atuin
    #   modifier: control
    #   keycode: char_r
    #   mode: [emacs, vi_normal, vi_insert]
    #   event: { send: executehostcommand cmd: (_atuin_search_cmd) }
    # }
  ]
  completions: {
    case_sensitive: false # set to true to enable case-sensitive completions
    algorithm: "fuzzy"    # prefix or fuzzy
    sort: "smart" # "smart" (alphabetical for prefix matching, fuzzy score for fuzzy matching) or "alphabetical"
    partial: false    # set this to false to prevent partial filling of the prompt
    quick: true    # set this to false to prevent auto-selecting completions when only one remains
    external: {
      enable: true
      max_results: 40
      completer: $external_completer
    }
    use_ls_colors: true # set this to true to enable file/path/directory completions using LS_COLORS
  }
  menus: [
  ]
}

use ($custom_completions | path join "bat/bat-completions.nu") *
use ($custom_completions | path join "gh/gh-completions.nu") *
use ($custom_completions | path join "git/git-completions.nu") *
use ($custom_completions | path join "tar/tar-completions.nu") *
use ($custom_completions | path join "pass/pass-completions.nu") *
# use ($custom_completions | path join "pytest/pytest-completions.nu") *
use ($custom_completions | path join "rg/rg-completions.nu") *
# use ($custom_completions | path join "pre-commit/pre-commit-completions.nu") *
# use ($custom_completions | path join "eza/eza-completions.nu") *
use ($custom_completions | path join "nix/nix-completions.nu") *
use ($module_nu_scripts | path join "modules/argx") *
use ($module_nu_scripts | path join "modules/lg") *
use ($module_nu_scripts | path join "modules/kubernetes") *
use ($custom_completions | path join "uv/uv-completions.nu") *
use ($module_nu_scripts | path join "modules/docker") *

alias d = ripdrag -a -x
