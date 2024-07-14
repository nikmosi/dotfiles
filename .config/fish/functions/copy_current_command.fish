function copy_current_command
    set current_command (commandline -p)
    echo $current_command | xclip -sel clip
end
