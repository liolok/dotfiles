# (https://fishshell.com/docs/current/cmds/bind.html)
# Simplest syntax: bind KEY ACTION(S)
# KEY: Run `fish_key_reader` to get key sequence, which depends on termianls.
# ACTIONS: (https://fishshell.com/docs/current/cmds/bind.html#special-input-functions)
function fish_user_key_bindings
    # Tested on Gnome terminal and TTY
    bind \e\x7F backward-kill-bigword # Alt Backspace
    bind \e\[3\;3~ kill-bigword # Alt Delete
    bind \e\r accept-autosuggestion execute # Alt Enter
end
