#!/bin/fish
# Dependencies: [xorg-xprop, wmctrl]

set id '0x[0-9a-fA-F]+' # regex pattern to match window IDs as hex value

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
wmctrl -via $most_recent_id # verbose, search window by ID, activate.
