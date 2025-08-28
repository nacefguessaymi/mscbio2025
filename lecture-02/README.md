# Lecture 2
This lecture was taught by [Dr. Uttam](https://www.uttamlab.com).
The slides for this lecture can be found [here.](https://mscbio2025-2025.github.io/lectures/lecture-02-files.slides.html#/)
## Filesystems
Filesystems follow a hierarchical "tree" of directories.
The root of this file system is `/` in Unix/Posix based system.
In Windows based systems the root directory is `C:\`.
In WSL, the `C:\` drive is mounted at a particular path.
The `cd` command allows for changing directory based on an absolute or relative path.
The `tree` command shows a hierarchical view of the directory.
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
