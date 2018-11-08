# everything else is the same as the original fasd plugin for oh-my-zsh
# except that I removed the alias definitions

if [ $commands[fasd] ]; then # check if fasd is installed
  eval "$(fasd --init auto)"
fi

if [ $commands[fasd] ]; then # check if fasd is installed
  fasd_cache="$HOME/.fasd-init-cache"
  if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
    fasd --init auto >| "$fasd_cache"
  fi
  source "$fasd_cache"
  unset fasd_cache
fi