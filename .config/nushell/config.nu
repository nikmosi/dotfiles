const config_dir = ($nu.config-path | path dirname)
const custom_completions = ($config_dir | path join ./modules/nu_scripts/custom-completions/)

source ($config_dir | path join "all_alias.nu")
source ($config_dir | path join "colors.nu")

mkdir ($nu.cache-dir | path join "carapace")
carapace _carapace nushell | save --force ($nu.cache-dir | path join "carapace/init.nu")
source ($nu.cache-dir | path join "carapace/init.nu")

mkdir ($nu.cache-dir | path join "atuin")
atuin init nu | save --force ($nu.cache-dir | path join "atuin/init.nu")
source ($nu.cache-dir | path join "atuin/init.nu")

# Starship
mkdir ($nu.cache-dir | path join "starship")
starship init nu | save --force ($nu.cache-dir | path join "starship/init.nu")
source ($nu.cache-dir | path join "starship/init.nu")

# zoxide
mkdir ($nu.cache-dir | path join "zoxide")
zoxide init nushell | save --force ($nu.cache-dir | path join "zoxide/init.nu")
source ($nu.cache-dir | path join "zoxide/init.nu")

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
                description: ($item | get -i description | default ""),
                display: $item.display,
                style: ($item | get -i style | default blue),
            }
        }
    )

    $completions_flat
}

# This completer will use carapace by default
let external_completer = {|spans|
    let expanded_alias = (scope aliases | where name == $spans.0 | get -i 0 | get -i expansion | default null)

    let spans = if $expanded_alias != null {
        let parts = ($expanded_alias | split row ' ' | get -i 0)
        $spans | skip 1 | prepend $parts
    } else {
        $spans
    }

    let completer = match $spans.0 {
        nu |
        lima |
        nh |
        alembic |
        ssh |
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
    {
      name: atuin
      modifier: control
      keycode: char_r
      mode: [emacs, vi_normal, vi_insert]
      event: { send: executehostcommand cmd: (_atuin_search_cmd) }
    }
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
use ($custom_completions | path join "git/git-completions.nu") *
use ($custom_completions | path join "gh/gh-completions.nu") *
use ($custom_completions | path join "docker/docker-completions.nu") *
use ($custom_completions | path join "tar/tar-completions.nu") *
use ($custom_completions | path join "pass/pass-completions.nu") *
use ($custom_completions | path join "pytest/pytest-completions.nu") *
use ($custom_completions | path join "rg/rg-completions.nu") *
use ($custom_completions | path join "pre-commit/pre-commit-completions.nu") *
use ($custom_completions | path join "eza/eza-completions.nu") *
use ($custom_completions | path join "nix/nix-completions.nu") *
