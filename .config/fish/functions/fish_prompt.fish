# ~/.config/fish/functions/fish_prompt.fish
# https://fishshell.com/docs/current/cmds/fish_prompt
# based on default prompt by Lily Ballard

function fish_prompt --description 'Write out the prompt'
    set --local last_pipestatus $pipestatus
    set --local --export __fish_last_status $status # export for __fish_print_pipestatus
    set -q fish_color_status
    or set -g fish_color_status --background=red white

    # write pipestatus
    # if the status was carried over (if no command is issued or if `set` leaves the status untouched), don't bold it.
    set --local bold_flag --bold
    set --query __fish_prompt_status_generation
    or set -g __fish_prompt_status_generation $status_generation
    test $__fish_prompt_status_generation = $status_generation
    and set bold_flag
    set __fish_prompt_status_generation $status_generation
    set --local status_color (set_color $fish_color_status)
    set --local statusb_color (set_color $bold_flag $fish_color_status)
    set --local prompt_status (__fish_print_pipestatus "[" "]\n" "|" "$status_color" "$statusb_color" $last_pipestatus)

    printf "$prompt_status"

    # color the prompt differently when we're root
    set --local color_cwd $fish_color_cwd
    set --local suffix '>'
    if functions --query fish_is_root_user
        and fish_is_root_user
        if set --query fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
        set suffix '#'
    end

    printf (prompt_login)
    set_color $color_cwd
    printf ' '
    printf (prompt_pwd --full-length-dirs 3)
    set_color normal
    printf (fish_vcs_prompt)

    printf "\n$suffix "
end
