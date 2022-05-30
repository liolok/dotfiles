# ~/.config/fish/functions/fish_greeting.fish
# https://fishshell.com/docs/current/cmds/fish_greeting
# https://fishshell.com/docs/current/faq.html#how-do-i-change-the-greeting-message

function fish_greeting
    if command --query fastfetch
        fastfetch
    else if command --query neofetch
        neofetch
    end
end
