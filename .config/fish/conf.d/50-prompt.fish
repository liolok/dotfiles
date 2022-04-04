# ~/.config/fish/conf.d/50-prompt.fish

if command --query starship
    and status is-interactive

    set --local conf $XDG_CONFIG_HOME
    test -n "$conf"; or set conf ~/.config
    set conf $conf/starship.toml

    if grep --quiet plain-text "$conf" # use no nerd font
        starship init fish | source # (https://starship.rs/#fish)
    end
end
