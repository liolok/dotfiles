# Set fish as interactive shell
# (https://wiki.archlinux.org/index.php/Fish#Modify_.bashrc_to_drop_into_fish)
[[ $(ps --no-header --pid=$PPID --format=cmd) != "fish" ]] && exec fish
