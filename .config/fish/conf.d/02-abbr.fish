# ~/.config/fish/conf.d/02-abbr.fish
# (https://fishshell.com/docs/current/cmds/abbr.html)

status is-interactive
or exit

# Use `-` as `cd -` to move to previous directory, for consistency with auto-cd.
# (https://github.com/fish-shell/fish-shell/issues/709#issuecomment-261745982)
a - 'cd -'

a fh 'free --human'

a nf neofetch

a pfb 'pkgfile --verbose --binaries'

a pm    pacman
a pmq  'pacman --query'
a pmqi 'pacman --query --info'
a pmqo 'pacman --query --owns'
a pmr  'pacman --remove'
a pms  'pacman --sync'
a pmsi 'pacman --sync --info'

a poweroff 'sync; and poweroff'
a reboot   'sync; and reboot'

a sc   systemctl
a sce 'systemctl edit'
a scr 'systemctl restart'
a scs 'systemctl status'

# Prepend sudo for needed command (if I'm not root and have sudo installed)
if test (whoami) != root
    and command --query sudo
    a pmr 'sudo pacman --remove'
    a pms 'sudo pacman --sync'
    a sce 'sudo systemctl edit'
    a scr 'sudo systemctl restart'
end
