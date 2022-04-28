# ~/.config/fish/functions/fish_greeting.fish
# https://fishshell.com/docs/current/cmds/fish_greeting
# https://fishshell.com/docs/current/faq.html#how-do-i-change-the-greeting-message
function fish_greeting
    command --query fastfetch
    and fastfetch
end
