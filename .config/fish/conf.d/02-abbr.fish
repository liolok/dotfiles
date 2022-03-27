# ~/.config/fish/conf.d/02-abbr.fish
# (https://fishshell.com/docs/current/cmds/abbr.html)

# Use `-` as `cd -` to move to previous directory, for consistency with auto-cd.
# (https://github.com/fish-shell/fish-shell/issues/709#issuecomment-261745982)
a - 'cd -'

a fh 'free --human'

a nf 'neofetch'

a pm 'pacman'
a pmq 'pacman --query'
a pmr 'pacman --remove'
a pms 'pacman --sync'

a sc 'systemctl'
a sce 'systemctl edit'
a scr 'systemctl restart'
a scs 'systemctl status'
