# ~/.config/fish/conf.d/00-env-var.fish

# Export environment varaiables only when login
# (https://fishshell.com/docs/current/cmds/status.html?highlight=is-login)
status is-login; or exit

# Prepend user executables search path
# (https://fishshell.com/docs/current/cmds/fish_add_path.html)
# (https://www.freedesktop.org/software/systemd/man/file-hierarchy.html#~/.local/bin/)
fish_add_path $HOME/.local/bin

# Temporary alias for quick export
# (https://fishshell.com/docs/current/#exporting-variables)
alias x 'set --global --export'

# XDG base directory
# (https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html#variables)
x XDG_CACHE_HOME  $HOME/.cache
x XDG_CONFIG_HOME $HOME/.config
x XDG_DATA_HOME   $HOME/.local/share

# Workarounds for XDG base directory
# (https://wiki.archlinux.org/title/XDG_Base_Directory#Partial)
x ANDROID_SDK_ROOT      $XDG_DATA_HOME/android-sdk
x CARGO_HOME            $XDG_DATA_HOME/cargo
x GNUPGHOME             $XDG_DATA_HOME/gnupg
x GTK2_RC_FILES         $XDG_CONFIG_HOME/gtk-2.0/gtkrc
x HISTFILE              $XDG_DATA_HOME/bash/history
x IPYTHONDIR            $XDG_DATA_HOME/ipython
x KDEHOME               $XDG_DATA_HOME/kde
x LESSHISTFILE          $XDG_DATA_HOME/less/history
x NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
x PYTHONSTARTUP         $XDG_CONFIG_HOME/python/startup.py
x PYLINTHOME            $XDG_CACHE_HOME/python-pylint
x RUSTUP_HOME           $XDG_DATA_HOME/rustup
x WGETRC                $XDG_CONFIG_HOME/wgetrc

# Use nano as default text editor
# (https://wiki.archlinux.org/title/Nano#Replacing_vi_with_nano)
x EDITOR nano
x VISUAL nano

# Input method module
# (https://wiki.archlinux.org/title/Fcitx5#Integration)
x GTK_IM_MODULE fcitx
x QT_IM_MODULE  fcitx
x XMODIFIERS    @im=fcitx

# KDE
# (https://wiki.archlinux.org/title/KDE#From_the_console)
x DESKTOP_SESSION plasma
x XAUTHORITY $XDG_RUNTIME_DIR/Xauthority

# GPG
# (https://wiki.archlinux.org/title/GnuPG#Configure_pinentry_to_use_the_correct_TTY)
x GPG_TTY (tty)

# Erase temporary alias
functions --erase x
