# ~/.config/fish/functions/roll.fish

function roll --description "Upgrade system, install new packages, and remove orphans."
    set pm pacman
    if not test (whoami) = root
        and command --query sudo
        set --prepend pm sudo
    end

    echo '[1] Upgrade system'
    # https://wiki.archlinux.org/title/Pacman#Upgrading_packages
    $pm --sync --refresh --sysupgrade # -Syu
    or return 1

    echo '[2] Install new packages'
    test -n "$argv" # non-zero length argument vector, try to install
    and $pm --sync --needed $argv

    echo '[3] Remove orphans'
    # https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#Removing_unused_packages_(orphans)
    set orphans (pacman --query --unrequired --deps --quiet) # -Qtdq
    test -z "$orphans" # zero length, nothing to remove
    or $pm --remove --nosave --recursive $orphans # -Rns
    or return 3
end
