if type -q rsync
  alias rsync-copy='rsync -avz --progress -h'
  alias rsync-move='rsync -avz --progress -h --remove-source-files'
  alias rsync-synchronize='rsync -avzu --delete --progress -h'
  alias rsync-update='rsync -avzu --progress -h'
end
