# (https://wiki.archlinux.org/index.php/Fish)
# (https://fishshell.com/docs/current/index.html)

# Powerline shell prompt
# (https://powerline.readthedocs.io/en/latest/usage/shell-prompts.html#fish-prompt)
set --append fish_function_path /usr/share/powerline/bindings/fish
string match --quiet '*pts*' (tty) && powerline-setup # only enable under pts

# Use `-` as `cd -` to move to previous directory, for consistency with auto-cd.
# (https://github.com/fish-shell/fish-shell/issues/709#issuecomment-261745982)
abbr -- - 'cd -'

# Alias
alias unset 'set --erase'
alias la 'exa --all --group --long'
alias pb 'curl -F "c=@-" "https://fars.ee/"'
