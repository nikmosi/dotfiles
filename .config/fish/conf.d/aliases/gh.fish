if type -q gh
  alias gh-create='gh repo create --public --source=. --remote=origin && git push -u --all && gh browse'
  alias gh-create-private='gh repo create --private --source=. --remote=origin && git push -u --all && gh browse'
end
