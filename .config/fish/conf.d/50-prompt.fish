# ~/.config/fish/conf.d/50-prompt.fish
# (https://starship.rs/guide/#fish)

string match --quiet '*pts*' (tty); or exit # only enable under pseudo terminal slaves
starship init fish | source
