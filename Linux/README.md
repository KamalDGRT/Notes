# Linux Notes

### Ways to open a Terminal

-   Right Click -> Open Terminal
-   Application -> Favourites -> Terminal
-   Application -> Utilities -> Terminal
-   Press Window button -> type `Terminal`
-   Move cursor to top-left -> Select Terminal from the dash
-   `Alt` + `F2` -> type `gnome-terminal` -> Press Enter

### Terminal Shortcuts

| Shortcut               | Description               |
| ---------------------- | ------------------------- |
| `Ctrl` + `Shift` + `+` | Font Size (Increase)      |
| `Ctrl` + `-`           | Font Size (Decrease)      |
| `Ctrl` + `Shift` + `T` | Create a tab in terminal  |
| `Ctrl` + `Shift` + `N` | To open _N_ terminals     |
| `Ctrl` + `Shift` + `W` | Close a Terminal Tab      |
| `Ctrl` + `Q`           | Close a Terminal Window   |
| `Alt` + `F4`           | Close a Terminal Window   |
| `Ctrl` + `L`           | Clear the Terminal screen |
| `clear`                | Clear the Terminal screen |
| one word + `Tab`       | Auto complete             |
| `Tab` + `Tab`          | next possible commands    |
| `F11`                  | Full Scren                |

### Bash Shell Prompt

-   Scenario 1

```nim
[student@desktop0  Documents] $
```

-   Scenario 2

```nim
[root@desktop0  Documents] #
```

| Item        | Meaning                   |
| ----------- | ------------------------- |
| `student`   | User                      |
| `desktop0`  | Hostname                  |
| `Documents` | Present Working Directory |
| `$`         | Normal User               |
| `#`         | Root User                 |

### Linux Directories

| Directory | What it is for                                            |
| --------- | --------------------------------------------------------- |
| `bin`     | normal user commands are stored                           |
| `sbin`    | root user commands are stored                             |
| `lib`     | library files are stored (32 bit processor)               |
| `lib64`   | library files are stored (64 bit processor)               |
| `boot`    | kernel will boot from this directory                      |
| `dev`     | device information i.e. hard disk                         |
| `etc`     | configuration files are stored here                       |
| `home`    | normal user can be stored                                 |
| `media`   | shows the external devices i.e. USB, CD                   |
| `run`     | runtime data for processes started since last boot        |
| `mnt`     | mounting directory (to link a partition with the folder ) |
| `opt`     | Optinal directory (could be used to install some apps)    |
| `proc`    | Processor info are stored                                 |
| `root`    | Root user home directory                                  |
| `srv`     | Service information                                       |
| `sys`     | System information                                        |
| `temp`    | Temporary directory                                       |
| `usr`     | `bin`, `sbin`, `lib64`, `lib` are stored in this          |
| `var`     | Variable directory                                        |
