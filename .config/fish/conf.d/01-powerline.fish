# (https://powerline.readthedocs.io/en/latest/usage/shell-prompts.html#fish-prompt)

if string match --quiet '*pts*' (tty) # only enable under pseudo terminal slaves
    set --local powerline_binding /usr/share/powerline/bindings/fish
    set --append fish_function_path $powerline_binding
    powerline-setup
end
