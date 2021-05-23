# (https://fishshell.com/docs/current/cmds/abbr.html)

# Temporary alias for quick add
alias a 'abbr --add'

# Use `-` as `cd -` to move to previous directory, for consistency with auto-cd.
# (https://github.com/fish-shell/fish-shell/issues/709#issuecomment-261745982)
a - 'cd -'
a fh 'free --human'
a nf 'neofetch'
a pm 'sudo pacman'
a sc 'sudo systemctl'

# Erase temporary alias
functions --erase a
