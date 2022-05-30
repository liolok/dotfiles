# ~/.config/fish/functions/fallback.fish
# https://stackoverflow.com/questions/54524521/in-fish-shell-how-to-set-a-variable-with-default-fallback/59532292#59532292

function fallback --argument-names "list" \
--description "Fallback to first non-zero string in given list"
    for value in $list
        if string length --quiet $value # non-zero string
            echo $value # output
            break
        end
    end
end
