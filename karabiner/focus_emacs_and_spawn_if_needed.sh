#!/usr/bin/env bash
set -uxo pipefail

FRAME_NAME=$1

emacs_server_is_running () {
    ps ux | grep "\bemacs\b" | grep -v grep >/dev/null
}

spawn_new_frame_with_title () {
    if emacs_server_is_running; then
        emacsclient -c -F "((name . \"${FRAME_NAME}\"))" &
    else
        emacs -T "$1" 2>/dev/null &
    fi
}

focus_emacs_window_with_title () {
  target_space=`/usr/local/bin/yabai -m query --windows | /usr/local/bin/jq "[.[] | select(.app | contains(\"Emacs\")) | select(.title | contains(\"$1\")) | .space][0]"`
  if [ $target_space == "null" ]; then
      target_space=0
  else
    /usr/local/bin/yabai -m space --focus "${target_space}";
  fi
  return "${target_space}"
}

# find if emacs frame with given title exists
focus_emacs_window_with_title ${FRAME_NAME}
emacs_frame_exists="$?"

# if not, spawn it
# if [ -z "$emacs_frame_exists" ]; then
if [ "$emacs_frame_exists" -eq "0" ]; then
  spawn_new_frame_with_title "${FRAME_NAME}"
fi


# yabai-focus-window on it
focus_emacs_window_with_title "${FRAME_NAME}"
