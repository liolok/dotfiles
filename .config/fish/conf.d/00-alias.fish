# ~/.config/fish/conf.d/00-alias.fish
# (https://fishshell.com/docs/current/cmds/alias.html)

alias a 'abbr --add'

alias l 'exa --all --git --group --long --time-style=iso'

# Pastebin: `command | pb` or `pb < /path/to/file`
# More usage: (https://fars.ee/#examples)
alias pb 'curl -F "c=@-" "https://fars.ee/"'

# (https://wiki.archlinux.org/title/Fish#Make_su_launch_fish)
alias su 'su --shell=/usr/bin/fish'

# (https://fishshell.com/docs/current/#exporting-variables)
alias x 'set --global --export'
