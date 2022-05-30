# ~/.config/fish/functions/howlong.fish
# https://fishshell.com/docs/current/language#envvar-CMD_DURATION
# https://fishshell.com/docs/current/cmds/math

function howlong --description "How long did last command take?"
    set duration $CMD_DURATION

    printf "Last command `%s` took " (history --max 1)
    set S 1000
    if test $duration -gt $S
        set M (math "60 * $S")
        if test $duration -gt $M
            set H (math "60 * $M")
            if test $duration -gt $H
                set h (math floor "$duration / $H")
                printf "$h hour"; test $h -gt 1; and printf "s"; printf ", "
                set duration (math "$duration - $h * $H")
            end
            set m (math floor "$duration / $M")
            printf "$m minute"; test $m -gt 1; and printf "s"; printf ", "
            set duration (math "$duration - $m * $M")
        end
        set s (math round "$duration / $S")
        test $s -gt 0; and printf "$s second"; test $s -gt 1; and printf "s"
    else
        printf "$duration millisecond"; test $duration -gt 1; and printf "s"
    end
    printf "\n"
end
