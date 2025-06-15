$env.__zoxide_hooked = true
# The prompt indicators are environmental variables that represent
# the state of the promp
$env.PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }

# If you want previously entered commands to have a different prompt from the usual one,
# you can uncomment one or more of the following lines.
# This can be useful if you have a 2-line prompt and it's taking up a lot of space
# because every command entered takes up 2 lines instead of 1. You can then uncomment
# the line below so that previously entered commands show with a single `🚀`.
# $env.TRANSIENT_PROMPT_COMMAND = {|| "🚀 " }
# $env.TRANSIENT_PROMPT_INDICATOR = {|| "" }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = {|| "" }
# $env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = {|| "" }
# $env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = {|| "" }
# $env.TRANSIENT_PROMPT_COMMAND_RIGHT = {|| "" }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Directories to search for scripts when calling source or use
# The default for this is $nu.default-config-dir/scripts
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
    ($nu.data-dir | path join 'completions') # default home for nushell completions
]

# Directories to search for plugin binaries when calling register
# The default for this is $nu.default-config-dir/plugins
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
# An alternate way to add entries to $env.PATH is to use the custom command `path add`
# which is built into the nushell stdlib:
# use std "path add"
# $env.PATH = ($env.PATH | split row (char esep))
# path add /some/path
# path add ($env.CARGO_HOME | path join "bin")
# path add ($env.HOME | path join ".local" "bin")
# $env.PATH = ($env.PATH | uniq)

# To load from a custom file you can use:
# source ($nu.default-config-dir | path join 'custom.nu')

let vars = (
  bash -c '
    env -i PATH=$PATH HOME=$HOME bash -c "
      source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
      env
    "
  '
)
| lines
| split column '='
| rename name value
| where name != 'PATH'
| where name != '_'
| where name != 'PWD'
| reduce -f {} {|row acc| $acc | upsert $row.name $row.value }

load-env $vars
$env.PATH = $env.PATH | append "/home/nik/.local/bin"
$env.GTK2_RC_FILES = "/usr/share/themes/Numix/gtk-2.0/gtkrc"
$env.RUFF_EXPERIMENTAL_FORMATTER = "True"
$env.QT_QPA_PLATFORMTHEME = "gtk3"
$env.LANG = "en_US.UTF-8"
$env.XDG_CONFIG_HOME = $"($env.HOME)/.config"
$env.VISUAL = "nvim"
$env.EDITOR = "nvim"
$env.SUDO_EDITOR = "nvim"
$env.GPG_TTY = (tty)
$env.RANGER_DEVICONS_SEPARATOR = "  "
$env.GTK_THEME = "Numix:dark"
$env.PASSWORD_STORE_ENABLE_EXTENSIONS = true

$env.OPENAI_API_KEY = "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"
$env.OPENAI_MODEL = "meta-llama/llama-3.3-8b-instruct:free" # Default to "gpt-4o"
$env.OPENAI_BASE_URL = "https://openrouter.ai/api/v1" # Default to None
