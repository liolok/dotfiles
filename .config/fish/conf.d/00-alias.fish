# ~/.config/fish/conf.d/00-alias.fish
# https://fishshell.com/docs/current/cmds/alias.html

alias a 'abbr --add --global'

if command --query exa
    alias l 'exa --all --git --group --long --time-style=long-iso --group-directories-first'
else
    alias l 'ls --almost-all -l --human-readable --time-style=long-iso'
end

alias hx helix

# Pastebin: `command | pb` or `pb < /path/to/file`
# More usage: https://fars.ee/#examples
alias pb 'curl -F "c=@-" "https://fars.ee/"'

# https://wiki.archlinux.org/title/Fish#Make_su_launch_fish
alias su 'su --shell=/usr/bin/fish'

# https://fishshell.com/docs/current/faq.html#how-do-i-set-or-clear-an-environment-variable
alias x 'set --global --export'
