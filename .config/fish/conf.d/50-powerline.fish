# (https://powerline.readthedocs.io/en/latest/usage/shell-prompts.html#fish-prompt)


string match --quiet '*pts*' (tty)l or exit # only enable under pseudo terminal slaves
set --local powerline_binding /usr/share/powerline/bindings/fish
test -d "$powerline_binding"; or exit # skip if not installed
set --append fish_function_path $powerline_binding
powerline-setup
