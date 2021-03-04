# (https://powerline.readthedocs.io/en/latest/usage/shell-prompts.html#fish-prompt)

if string match --quiet '*pts*' (tty) # only enable under pseudo terminal slaves
    set --append fish_function_path /usr/share/powerline/bindings/fish
    powerline-setup
end
