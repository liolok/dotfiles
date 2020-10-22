# (https://wiki.archlinux.org/index.php/Fish)
# (https://fishshell.com/docs/current/index.html)

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
abbr --add pm 'sudo pacman'
abbr --add sys 'sudo systemctl'

# Aliases
# (https://fishshell.com/docs/current/cmds/alias.html)
alias l 'exa --all --git --group --long --time-style=long-iso'
# Pastebin: `command | pb` or `pb < /path/to/file`
# More usage: (https://fars.ee/#examples)
alias pb 'curl -F "c=@-" "https://fars.ee/"'
alias su 'su --shell=/usr/bin/fish'
