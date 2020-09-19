#!/bin/bash

if ! command -v kitty >/dev/null; then
  exit 1
fi

case "$1" in
"light")
  kitty @ set-colors -a -c "$HOME/.config/kitty/base16-kitty/colors/base16-atelier-sulphurpool-light.conf"
  ;;
"dark")
  kitty @ set-colors -a -c "$HOME/.config/kitty/kitty-themes/themes/Nova.conf"
  ;;
*)
  cat <<EOF
    usage: chtheme [light|dark]
EOF
esac
