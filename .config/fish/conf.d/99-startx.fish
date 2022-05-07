# ~/.config/fish/conf.d/99-startx.fish
# https://wiki.archlinux.org/title/Xinit#Autostart_X_at_login
# https://wiki.archlinux.org/title/Fish#Start_X_at_login
# https://wiki.archlinux.org/title/KDE#From_the_console
# https://wiki.archlinux.org/title/Xorg#Session_log_redirection
# https://fishshell.com/docs/current/language#input-output-redirection

if not status is-login # not login shell
    or not command --query startx # xorg-xinit not installed
    or string length --quiet $DISPLAY # X already started?
    or not string length --quiet $XDG_VTNR # virtual terminal number not set
    or test "$XDG_VTNR" -gt 1 # virtual terminal number greater than 1

    exit
end

set --local data_home $XDG_DATA_HOME
string length --quiet $data_home
or set --local data_home ~/.local/share
set --local data_xorg $data_home/xorg
mkdir --parents $data_xorg

exec startx /usr/bin/startplasma-x11 &> $data_xorg/session.log
