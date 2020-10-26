#!/usr/bin/env bash
set -uxo pipefail

FRAME_NAME=$1


spawn_new_frame_with_title () {
    echo "Spawning emacs with title ${FRAME_NAME}"
    /usr/local/bin/emacsclient -c -n -F "((name . \"${FRAME_NAME}\"))" --alternate-editor="" # disown -a?	
}

focus_emacs_window_with_title () {
  target_space=`/usr/local/bin/yabai -m query --windows | /usr/local/bin/jq "[.[] | select(.app | contains(\"Emacs\")) | select(.title | contains(\"$1\")) | .space][0]"`
  if [ $target_space == "null" ]; then
      target_space=0
      echo "Emacs with title ${FRAME_NAME} not found"
  else
    echo "Found Emacs with title ${FRAME_NAME} - focusing space #${target_space}"
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
  # and yabai-focus-window on it
  focus_emacs_window_with_title "${FRAME_NAME}"
fi


