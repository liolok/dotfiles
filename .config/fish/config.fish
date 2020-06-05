# (https://wiki.archlinux.org/index.php/Fish)
# (https://fishshell.com/docs/current/index.html)

# Real user home, not applications $HOME like `/home/liolok/apps`.
# If not exist, for example running as root, just fallback to $HOME.
set HOME_USER /home/$USER; test -d $HOME_USER || set HOME_USER $HOME

# PATH: directory search list of executable files
# (https://fishshell.com/docs/current/tutorial.html#path)
# set --prepend fish_user_paths $HOME_USER/scripts # my script directory

# Powerline shell prompt
# (https://powerline.readthedocs.io/en/latest/usage/shell-prompts.html#fish-prompt)
set --append fish_function_path /usr/share/powerline/bindings/fish
# Only enable under pseudo terminal slaves
string match --quiet '*pts*' (tty) && powerline-setup

# Abbreviations
# (https://fishshell.com/docs/current/cmds/abbr.html)
# Use `-` as `cd -` to move to previous directory, for consistency with auto-cd.
# (https://github.com/fish-shell/fish-shell/issues/709#issuecomment-261745982)
abbr --add - 'cd -'
abbr --add fh 'free --human'
abbr --add neo 'neofetch'
abbr --add pm 'pacman'
abbr --add sys 'systemctl'

# Aliases
# (https://fishshell.com/docs/current/cmds/alias.html)
alias l 'exa --all --git --group --long --time-style=long-iso'
# Pastebin: `command | pb` or `pb < /path/to/file`
# More usage: (https://fars.ee/#examples)
alias pb 'curl -F "c=@-" "https://fars.ee/"'
alias su 'su --shell=/usr/bin/fish'
