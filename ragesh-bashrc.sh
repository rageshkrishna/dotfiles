export TERM=xterm-256color

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

alias tmux='tmux -2'
# TMUX
if which tmux 2>&1 >/dev/null; then
  # if no session is started, start a new session
  test -z "$TMUX" && (tmux attach || tmux new-session)
fi


LS_COLORS=$LS_COLORS:'di=01;36:'; export LS_COLORS

alias shgrep='grep --exclude-dir=logs --exclude-dir=node_modules --exclude-dir=.git --exclude=*.min.js --exclude=*.cat.js -Rn'
alias migrateship='psql -h 172.17.42.1 -U apiuser -W -d shipdb -f ~/api/models/migrations.sql'
alias authship='psql -h 172.17.42.1 -U apiuser -d shipdb -f ~/custom/setupAuth.sql'
alias proxyship='docker-compose -f ~/rageshkrishna/nginx-dev-proxy/nginx.yml up -d nginx'

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[00;36m\]\w$(__git_ps1 " \[\033[38;5;208m\](%s)")\[\033[00m\]\$ '
