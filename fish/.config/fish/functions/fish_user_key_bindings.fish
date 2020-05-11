# (https://fishshell.com/docs/current/cmds/bind.html)
function fish_user_key_bindings
    bind \cH backward-kill-word # Ctrl Backspace under Gnome terminal and Guake
    bind \e\x7f backward-kill-bigword # Alt Backspace
end
