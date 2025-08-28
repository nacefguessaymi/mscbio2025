# Lecture 2
This lecture was taught by [Dr. Uttam](https://www.uttamlab.com).
The slides for this lecture can be found [here.](https://mscbio2025-2025.github.io/lectures/lecture-02-files.slides.html#/)
## Filesystems
Filesystems follow a hierarchical "tree" of directories.
The root of this file system is `/` in Unix/Posix based system.
In Windows based systems the root directory is `C:\`.
In WSL, the `C:\` drive is mounted at a particular path.
### Tree
I already had tree installed on my machine using `brew install tree` on a MacOS.
My linux machine was easier `sudo pacman -S tree`.
My peers had difficulty installing it on their Windows machins with WSL as `sudo apt install tree` was giving an error.
I believe Ubuntu has changed the package manager.
## Filetypes
The extensions for files only give information about the _type_ of file.
This can be easily mislabelled.
<div class="alert">
  <strong>Warning!</strong> This is a common form of attack. An attacker will change the file extenstion of a binary executable to something like `.txt` and ask for someone to open the file. This file will then execute with the attack of interest.
</div>

## Paths
Paths can follow relative or absolute paths.
This is particularly important when writing code or scripts.
## Commandline from Python
Command line (bash) commands can be used in jupyter or python using `!` or  `%%bash` before the command.
## Common Command Line Operations
The `cd` command allows for changing directory based on an absolute or relative path.
The `tree` command shows a hierarchical view of the directory.
The `pwd` shows the absolutely path of the current directory.
The `mkdir` command creates a directory.
The `cp` and `mv` commands copy or move files. The `mv` command can also be used to rename a file or directory.
The `rm` command deletes a file.
## Activity
I have included a bash script that has the activity completed.
It is in `./lecture-02-script.sh` and the results are in `./lecture-02.log`.
## Remote Access
Downloading files with an open link can be done using `curl` or `wget`.
### SSH
Secure connection to a remote machine can be done using `ssh`.
I use this all the time for the [CRCD.](https://crc.pitt.edu)
A key can be generated using `ssh-keygen -t [encryption type] -f [output_file]`.
This can then be copied to the remote machine using `ssh-copy-id -i [identity file] [remote-machine]`.
The `config` file in the `.ssh` directory can be modified to set up an ssh alias for the remote machine.
### File Transfer
Secure transfer can be done using `scp` or `rsync`.
The `scp` command is a more inefficient than `rsync`.
This is due to the fact that `rsync` uses a delta transfer algorithm with some additional optomizations for large file transfers, while `scp` copies the source file directly.
#### Delta Transfer Algorithm
More information about this can be found [in this page.](https://rsync.samba.org/tech_report/node2.html)
The quick summary is that the transfer is segemented into blocks with an MD4 checksum for each block.
The algorithm searches through the blocks in the local machine and only copies the checksums that are not found.
## Change File Modes
The file mode for a file can be changed using `chmod [options] mode file`.
The `mode` can be set either with a string `u` setting the user permissions,  `rwx` standing for the different permissions read, write, and execute, respectively.
It can also be set using integer values in the format `ijk` where `i`, `j`, or `k` bein the sum of `1`, `2`, and `4`, and set the user, group, and anyone permissions, respectively.
`1` stands for `x`, `2` for `w`, and `4` for `r`.
A sum of these numbers always yields a unique integer.
## Disk Usage
The command `du [options] files` can be used to show the disk usage of the `files` specified and the options set can be `s` for a summary or `h` for a human readable format.
The `df [options]` can similarly be used to show the entire disk's usage.
### Checking Files
File permissions can be shown using the `ls [options]` command with the `l` flag.
In addition the the `h` flag shows the sizes in a human readable format.
The `s` flaggives a summary.
## Finding Files
The `locate` command can be used to find files systemwide.
The `find` command searches the directory tree.
The `which` command shows the absolute path of a command.
A command with `man` will show the manual for that command.
