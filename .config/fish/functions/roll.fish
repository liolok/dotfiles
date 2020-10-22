function roll --description "Upgrade the system and maybe install new packages"
    # (https://wiki.archlinux.org/index.php/Pacman#Upgrading_packages)
    sudo pacman -Syu
    if test -n "$argv"; sudo pacman -S --needed $argv; end
    # (https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Removing_unused_packages_(orphans))
    # sudo pacman -Rns (pacman -Qtdq) # outputs error if no orphans found
    # (https://github.com/farseerfc/dotfiles/blob/d4f353104bc4ade853c55ad9d8d3cd7d56bb7044/zsh/.bashrc#L62)
    pacman -Qtdq | ifne sudo pacman -Rcs - # `ifne` depends on package `moreutils`
end
