export TERM=xterm-256color

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [[ -z "$TMUX" ]] ;then
  ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
  if [[ -z "$ID" ]] ;then # if not available create a new one
      tmux new-session
  else
      tmux attach-session -t "$ID" # if available attach to it
  fi
fi
