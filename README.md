# liolok's dotfiles

App config files of liolok, managed with `git` and `stow` <sup>[[my post]][1]</sup>.

[1]: https://liolok.github.io/Manage-Dotfiles-with-Git-and-Stow/

## Workflow

To deploy apps, e.g. `fish` and `tmux`:

```console
# pacman -Syyu git stow sudo
$ git clone https://github.com/liolok/dotfiles
$ ./dotfiles/deploy fish tmux
```

## Acknowledgement

- [farseerfc/dotfiles](https://github.com/farseerfc/dotfiles)
- [rocka/dotFiles](https://github.com/rocka/dotFiles)
- [wuliaotc/dotfiles](https://github.com/wuliaotc/dotfiles)
