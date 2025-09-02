# Lecture 03
This lecture was taught by [Dr. John Barton](https://bartonlab.github.io).
The slides for this lecture can be found [here.](https://mscbio2025-2025.github.io/lectures/lecture-03-bash.slides.html#/)
## Review
The basic commands for command line manipulation of files are shown in the table below.
| Command | Function |
| ------- | -------- |
| ls | list files in current directory |
| cd | change directory to path named (can be relative or absolute) |
| pwd | current working directory |
| .. | parent directory from relative path |
| . | current directory |
| cp | copy file from path to path specified |
| mv | moves file from path to path specified (can also rename files) |
| rm | remove file or path (-r flag) |
## Environmental Variables
Variables can be set and stored in the terminal session using
```bash
NAME=value
```
To save the variable in future spawned sessions the `export` command should be done.
```bash
export NAME=value
```
The varible type can be set using the declare command using the flags `-i` for an integer, `-s` for a string, `-a` for an array.
The `-x` flag sets the variable to export.
The `unset` command can unset the variable.
The `$` character is used to get the value of the variable.
`bash` commands can also be set as a varible using the ` character.
## Command Line
`bash` is capable of `for` and `if` statements.
It is also capable of nesting these statements.
An exmple of this can be seen in the `./lecture-03-script.sh` script.
## Input and Output Direction
`bash` is capable of directing the output and inputs for commands.
The `>` character will direct the output to a file.
This will either create or rewrite the file completely.
The `>>` characters will send the output to a file appending it.
The `<` chracter will send the file to the input of the command.
`2>` will send an error to the a file.
Finally, `&>` sends the output and standard errors to a file.
### Printing Contents of a File
The `cat` command will print the contents of a file.
### Pipe Commands
The pipe `|` redirects the output of a command to another command.
This can chain multiple commands together, and allows for powerful word processing.
## Text Manipulation
The commands for different text manipulations in `bash` are shown in the table below.
| Command | Function |
| ---- | ---- |
| cat | prints the file to stdout |
| less | view the file contents one screen at a time |
| head | shows the first 10 lines |
| tail | shows the last 10 lines |
| wc | counts the lines/words/characters in an input |
| sort | sorts the file by line and prints |
| uniq | removes duplicates that are adjacent |
| cut | extracts fixed width columns from file |
## More Advanced Text Manipulation
The `grep`, `sed`, and `awk` commands can be used for more advanced text manipulation.
`grep` searches the contents of a file for an expression.
`sed` sends a stream to an editor that performs a substitution.
`awk` scans for patterns and processes them, which is great for columnar data.
### grep
The `grep` command can be used in the following manner:
```bash
grep pattern file(s)
```
The flags `-r` uses a recursive search, `-I` skips binary files, `-s` supresses errors, `-n` shows line number, `-A` and `-B` shows N times after N lines and N times before N lines, respectively.
The patterns `^pattern` must be at the start of a line and `pattern$` must be at the end of the line.
The `.` character matches any character, similar to the `*` wildcard in bash.
The `.*` matches an character repeated any number of times.
The `\.` escape character treats special characters literally, rather than treating the period as a wildcard.
### awk
