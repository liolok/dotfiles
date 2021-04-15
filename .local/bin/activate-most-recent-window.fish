#!/bin/fish
# Dependencies: [xorg-xprop, wmctrl]

# Regex patterns
set id '0x[0-9a-fA-F]+' # window ID as hex value
set desktop '\d+' # desktop index as non-negative integer

# (https://specifications.freedesktop.org/wm-spec/wm-spec-latest.html#idm45623487919680)
set active_id (xprop -root _NET_ACTIVE_WINDOW | string match --regex $id)
echo Active window ID: $active_id

# (https://specifications.freedesktop.org/wm-spec/wm-spec-latest.html#idm45623487941200)
set id_stack (xprop -root _NET_CLIENT_LIST_STACKING | string match --all --regex $id)
echo Window ID stack from bottom to top: $id_stack

set active_index (contains --index $active_id $id_stack)
set most_recent_index (math $active_index - 1)
test $most_recent_index -gt 0; or exit # assert index greater than zero
set most_recent_id $id_stack[$most_recent_index]

# (https://specifications.freedesktop.org/wm-spec/wm-spec-latest.html#idm45623487854480)
set target_desktop (xprop -id $most_recent_id _NET_WM_DESKTOP | string match --regex $desktop)

# (https://specifications.freedesktop.org/wm-spec/wm-spec-latest.html#idm45623487926576)
set current_desktop (xprop -root _NET_CURRENT_DESKTOP | string match --regex $desktop)

# Avoid switching to other desktop
if test $target_desktop != $current_desktop
    echo Most recent window is NOT on current desktop.
    exit
end

wmctrl -via $most_recent_id # verbose, search window by ID, activate.
