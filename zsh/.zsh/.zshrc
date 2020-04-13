# Mix `grml-zsh-config` and `powerline`
prompt off #unset grml prompt
powerline-daemon -q #run powerline daemon
. /usr/share/powerline/bindings/zsh/powerline.zsh

# https://github.com/zsh-users/zsh-autosuggestions#usage
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="bg=bold,underline"
export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)
export ZSH_AUTOSUGGEST_USE_ASYNC=truex
. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# https://wiki.archlinux.org/index.php/Zsh#Fish-like_syntax_highlighting
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# https://github.com/zsh-users/zsh-history-substring-search#usage
. /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# https://wiki.archlinux.org/index.php/Zsh#The_%22command_not_found%22_handler
. /usr/share/doc/pkgfile/command-not-found.zsh

# Key Bindings for Gnome Terminal
bindkey -M emacs '^[[3;5~' kill-word #C trl-Delete
bindkey -M emacs '^H' backward-kill-word # Ctrl-Backspace

# Roll System
# https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Removing_unused_packages_(orphans)
function Syu() {
    sudo pacman -Syu # upgrade all packages except AUR ones
    pacman -Qtdq | ifne sudo pacman -Rcs - # `ifne` depends on `moreutils`
}

# Pastebin, fars.ee is a temporary deployment of pb by farseerfc
alias pb="curl -F "c=@-" "https://fars.ee/""

# Abbreviations
alias la="exa --all --group --long"
alias enable="systemctl enable"
alias disable="systemctl disable"
alias start="systemctl start"
alias stop="systemctl stop"
alias status="systemctl status"
alias restart="systemctl restart"
alias neo="neofetch"

# If $HOME is fake then so is `~`, use `~.` for real user home path.
# For faking $HOME refer to ../../pam_env/.pam_environment.
# http://zsh.sourceforge.net/Doc/Release/Expansion.html#Static-named-directories
[[ $HOME != /home/$USER ]] && hash -d .=/home/$USER
