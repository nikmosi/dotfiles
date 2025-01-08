for file in (realpath (dirname (status --current-filename))/aliases/*.fish)
  source $file
end
