# ~/.config/fish/functions/howlong.fish
# https://fishshell.com/docs/current/language#envvar-CMD_DURATION
# https://fishshell.com/docs/current/cmds/history
# https://fishshell.com/docs/current/cmds/math
# https://fishshell.com/docs/current/cmds/set_color

function howlong --description "How long did last command take?"
    set duration $CMD_DURATION # in milliseconds

    printf "Last command `%s` took " (history --max 1)
    set S 1000 # one second
    if test $duration -gt $S
        set M (math "60 * $S") # one minute
        if test $duration -gt $M
            set m (math floor "$duration / $M")
            set_color red; printf $m; set_color normal
            printf ' minute'; test $m -gt 1; and printf 's'; printf ' '
            set duration (math "$duration - $m * $M")
        end
        set s (math round "$duration / $S")
        if test $s -gt 0
            set_color yellow; printf $s; set_color normal
            printf ' second'; test $s -gt 1; and printf 's'
        end
    else if test $duration -gt 0
        set_color green; printf $duration; set_color normal
        printf ' millisecond'; test $duration -gt 1; and printf 's'
    else
        printf 'no time at all'
    end
    printf "\n"
end
