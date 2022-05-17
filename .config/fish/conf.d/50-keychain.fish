# ~/.config/fish/conf.d/50-ssh-key.fish
# https://wiki.archlinux.org/title/SSH_keys#Keychain
# https://man.archlinux.org/man/keychain.1

if status is-login
    and command --query keychain
    set --local options --eval --quiet --ignore-missing --noask
    # https://wiki.archlinux.org/title/XDG_Base_Directory#Partial
    set --append options --absolute --dir "$XDG_RUNTIME_DIR"/keychain
    keychain $options id_ed25519 | source
end
