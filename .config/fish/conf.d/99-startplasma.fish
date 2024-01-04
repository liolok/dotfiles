# ~/.config/fish/conf.d/99-startplasma.fish
# https://wiki.archlinux.org/title/KDE#From_the_console
# https://wiki.archlinux.org/title/Xinit#Autostart_X_at_login
# https://wiki.archlinux.org/title/Fish#Start_X_at_login
# https://wiki.archlinux.org/title/Xorg#Rootless_Xorg
# https://wiki.archlinux.org/title/Xorg#Session_log_redirection
# https://fishshell.com/docs/current/language#input-output-redirection

if status is-login
    and not string length --quiet $DISPLAY # not started yet
    and string length --quiet $XDG_VTNR # virtual terminal number set
    and test "$XDG_VTNR" -eq 1 # tty1's virtual terminal number is 1
    if command --query startplasma-wayland
        set --global --unexport GTK_IM_MODULE
        set --global --unexport QT_IM_MODULE
        set --global --export MOZ_ENABLE_WAYLAND 1
        startplasma-wayland
    else if command --query startx
        set --local data_home $XDG_DATA_HOME
        string length --quiet $data_home
        or set --local data_home ~/.local/share
        set --local data_xorg $data_home/xorg
        mkdir --parents $data_xorg

        # https://wiki.archlinux.org/title/XDG_Base_Directory
        set --global --export XAUTHORITY $XDG_RUNTIME_DIR/xauthority
        # https://wiki.archlinux.org/title/Getty#Virtual_console
        set --global --export XDG_SESSION_TYPE x11
        # https://wiki.archlinux.org/title/KDE#From_the_console
        set --global --export DESKTOP_SESSION plasma
        startx /usr/bin/startplasma-x11 -- -keeptty &> $data_xorg/session.log
    end
end
