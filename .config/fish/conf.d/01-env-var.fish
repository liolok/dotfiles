# ~/.config/fish/conf.d/01-env-var.fish
# https://fishshell.com/docs/current/faq#how-do-i-set-or-clear-an-environment-variable

functions --query x # alias already defined
or alias x 'set --global --export'

# Real home directory
if set --query HOME_FAKE # set by ~/.local/bin/fakehome
    set --local real_user (fallback $SUDO_USER $USER)
    # https://man.archlinux.org/man/getent.1 https://man.archlinux.org/man/passwd.5
    set --local real_home (string split : (getent passwd $real_user) --fields 6)
    if test -n "$real_home"
        x HOME $real_home
        set --erase HOME_FAKE
    end
end

# Prepend user executables search path (only once when login)
# https://fishshell.com/docs/current/cmds/status?highlight=is-login
# https://fishshell.com/docs/current/cmds/fish_add_path
# https://www.freedesktop.org/software/systemd/man/file-hierarchy#~/.local/bin/
status is-login
and fish_add_path $HOME/.local/bin

# XDG base directory
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest#variables
x XDG_CACHE_HOME  $HOME/.cache
x XDG_CONFIG_HOME $HOME/.config
x XDG_DATA_HOME   $HOME/.local/share
x XDG_STATE_HOME  $HOME/.local/state

# Workarounds for XDG base directory
# https://wiki.archlinux.org/title/XDG_Base_Directory#Partial
x ANDROID_SDK_ROOT      $XDG_DATA_HOME/android-sdk
x CARGO_HOME            $XDG_DATA_HOME/cargo
x CUDA_CACHE_PATH       $XDG_CACHE_HOME/nvidia
x DVDCSS_CACHE          $XDG_CACHE_HOME/dvdcss
x GNUPGHOME             $XDG_DATA_HOME/gnupg
x GOPATH                $XDG_DATA_HOME/go
x GTK2_RC_FILES         $XDG_CONFIG_HOME/gtk-2.0/gtkrc
x HISTFILE              $XDG_STATE_HOME/bash/history
x IPYTHONDIR            $XDG_DATA_HOME/ipython
x JUPYTER_CONFIG_DIR    $XDG_CONFIG_HOME/jupyter
x KDEHOME               $XDG_DATA_HOME/kde
x LESSHISTFILE          $XDG_DATA_HOME/less/history
x NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
x PYTHONSTARTUP         $XDG_CONFIG_HOME/python/startup.py
x PYLINTHOME            $XDG_CACHE_HOME/python-pylint
x RUSTUP_HOME           $XDG_DATA_HOME/rustup
x SQLITE_HISTORY        $XDG_DATA_HOME/sqlite/history
x SSB_HOME              $XDG_DATA_HOME/zoom
x WGETRC                $XDG_CONFIG_HOME/wget/config.ini
x XAUTHORITY            $XDG_RUNTIME_DIR/Xauthority

# Use nano as default text editor
# https://wiki.archlinux.org/title/Nano#Replacing_vi_with_nano
x EDITOR nano
x VISUAL nano

# Input method module
# https://wiki.archlinux.org/title/Fcitx5#Integration
x GTK_IM_MODULE fcitx
x QT_IM_MODULE  fcitx
x XMODIFIERS    @im=fcitx

# https://wiki.archlinux.org/title/KDE#From_the_console
x DESKTOP_SESSION plasma

# https://wiki.archlinux.org/title/GnuPG#Configure_pinentry_to_use_the_correct_TTY
x GPG_TTY (tty)

# https://wiki.archlinux.org/title/Uniform_look_for_Qt_and_GTK_applications#Consistent_file_dialog
x GTK_USE_PORTAL 1
