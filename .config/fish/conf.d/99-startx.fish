# ~/.config/fish/conf.d/99-startx.fish
# https://wiki.archlinux.org/title/Fish#Start_X_at_login

status is-login; and test -z "$DISPLAY"; and test "$XDG_VTNR" = 1; or exit
# https://wiki.archlinux.org/title/Xorg#Session_log_redirection
set --local data_dir $XDG_DATA_HOME/xorg
mkdir --parents $data_dir
exec startx /usr/bin/startplasma-x11 &> $data_dir/session.log
