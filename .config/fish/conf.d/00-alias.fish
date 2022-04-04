# ~/.config/fish/conf.d/00-alias.fish
# (https://fishshell.com/docs/current/cmds/alias.html)

alias a 'abbr --add --global'

if command --query exa
    alias l 'exa --all --git --group --long --time-style=long-iso'
else
    alias l 'ls --almost-all -l --human-readable --time-style=long-iso'
end

# Pastebin: `command | pb` or `pb < /path/to/file`
# More usage: (https://fars.ee/#examples)
alias pb 'curl -F "c=@-" "https://fars.ee/"'

# (https://wiki.archlinux.org/title/Fish#Make_su_launch_fish)
alias su 'su --shell=/usr/bin/fish'

# (https://fishshell.com/docs/current/#exporting-variables)
alias x 'set --global --export'
