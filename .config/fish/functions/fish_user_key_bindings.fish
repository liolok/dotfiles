# ~/.config/fish/functions/fish_user_key_bindings.fish
# https://fishshell.com/docs/current/cmds/bind
# Simplest syntax: bind KEY ACTION(S)
# KEY: Run `fish_key_reader` to get key sequence, which depends on terminals.
# ACTIONS: https://fishshell.com/docs/current/cmds/bind#special-input-functions

function fish_user_key_bindings
    # Tested on Gnome terminal, Konsole and TTY
    bind \e\x7F backward-kill-bigword # Alt Backspace
    bind \e\[3\;3~ kill-bigword # Alt Delete
    bind \e\r accept-autosuggestion execute # Alt Enter
end
