# Bash

## Basic commands

1. `ls` &nbsp; List files in the active folder.
    ```sh
    #   OPTIONS:
    ls -a  # list hidden files, too
    ls -l  # list details
    ls -r  # list in reverse
    ls -S  # list order by file size
    ls -t  # list order by file time
    ```

1. `cd` &nbsp; Navigate to other files.
    ```sh
    #   POSSIBLE PATHS:
    cd .  # current directory
    cd .. # parent directory
    cd -  # previous directory
    cd /  # path starting at root folder
    cd ~  # path starting at home folder
    ```

1. &nbsp; `touch` and `rm`
    - To make a file, use `touch` and a file name.
    - To remove a file, use `rm` and a file name.
    - optional file names: 
        - `*` &nbsp; all files
    - options:
        - `-r` &nbsp; recursive
        - `-f` &nbsp; force

1. &nbsp; `mkdir` and `rmdir`
    - To make a file, use `mkdir` and a folder name.
    - To remove an empty file, use `rmdir` and a folder name.
    - To remove a folder and all files and subfolders, use `rm -rf` and a folder name.
    - For example:
        ```sh
        rm -rf ./Folder_Full_of_Files
        ```

1. `;` (semicolon) &nbsp; Runs one command after another. In the example below, the second will try to run regardless of whether the first succeeded.
    ```sh
    touch example.txt ; nano example.txt
    ```
1. `&&` &nbsp; Runs one command after another only if the first ran without any errors. In the xample below, the second will only proceed if the first was successful.
    ```sh
    touch example.txt && nano example.txt
    ```

1. ↑ &nbsp; Populate the command line with the previous command.

1. `!!` &nbsp; The last command you ran.

1. `!2` &nbsp; The second command you have ever run.

1. `!-2` &nbsp; The second-most-recent command you have run.

1. `!!:q` &nbsp; The last command you ran, enclosing the substitution in single quotes to prevent further expansion.

1. `!$` &nbsp; The last argument you used.

1. `sudo` &nbsp; Use admin credentials to run commands that require permission.

1. `history` &nbsp; See your bash history (i.e., the contents of ~/.bash_history).

1. `echo` &nbsp; Print something.

1. `printf` &nbsp; Print something.

1. `cat` &nbsp; Shows contents of one or more files.
    ```sh
    cat employee1.txt employee2.txt
    ```

1. `more` and `less`: &nbsp; Show contents one screen at a time. Use with one or more file names.

1. `^` (carat) &nbsp; Substitute, swapping out part of the previous command for something else. For example, if you make a typo in a long command, such as typing `mr` instead of `rm`, and you don't want to retype the whole command, replace the typo with the correction using `^`.
    ```sh
    mr ~/Desktop/fotos/holidays/Thanksgiving/pre-dinner-bash/IMG_7477.jpg

    ^mr^rm
    ```

1. `>`, `<`, and `|` &nbsp; 
    
    To redirect the output of a command to a file or stream, use `>` between the command and the file name.
    ```sh
    pg_dump mydb > mydb_bkup.sql
    ```
    To run a command with the contents of a file, use `<` between the command and the file name.
    ```sh
    somecommand < temp_file
    ```
    To pipe output from one command to another command, use `|`.
    ```sh
    ls -al | more
    ```

1. `find` Find a file

1. `sed` &nbsp; Find and replace

1. `json` &nbsp; Edit JSON. Before you can use it, you must install with `npm i -g json`.
    - `-f` option: Edit a file. Follow this option with the name of a file you want to edit.
    - `-I` option: Edit in place.
    - `-e` Evaluate the following string as JavaScript.
    - Example: `json -If package.json -e 'this.scripts.start = "PORT='$1' " + this.scripts.start'`

1. `ps aux` &nbsp; See all running processes.
    - This command becomes more useful when combined with `grep` below, thereby limited the number of commands to what is relevant.
    ```sh
    ps aux | grep node
    ```
    - When using `ps aux | grep`, included in the commands shown will be the `grep` process itself. To avoid this false positive when running `ps aux`, encase the first letter of your `grep` argument with square brackets.
    ```sh
    ps aux | grep [r]code
    ```
1. `grep` (with `|`) &nbsp; Only show portion of a command's output, filtered by the argument.
    ```sh
    ps aux | grep node
    ```
1. `killall` &nbsp; Kill all processes with the given process name. 
    - `killall` only matches the process name, not all the process's arguments, so it may not work when naming a bash script by name, since bash scripts run as an argument for bash and not as a distinct compiled program.
1. `kill` &nbsp; Kill a process by process number.
1. `pkill -f` &nbsp; Kill all processes by matching against processes *and* arguments. Unlike `killall`, this command can kill even bash scripts running as arguments of another program.

***

## Variables
Bash has built-in variables. These are generally in all caps (so it is good practice to name new variables using at least one lowercase letter).

PATH
Add paths for console commands.
- Enclose in single quotes.
- Separate path chunks with colon (`:`).
- Finish by appending `$PATH` to the end.
- Set `CDPATH=.:~/Docs:~/Music:$PATH` to add these chunks to the path.

CDPATH
Add paths for the `cd` command.
- Enclose in single quotes.
- Start with period (`.`).
- Separate path chunks with colon (`:`).
- Finish by appending `$CDPATH` to the end.
- Set `CDPATH=.:~/Docs:~/Music:$CDPATH` to add these chunks to the path.

HISTSIZE
Determines allowable size of .bash_history file.
- Set `HISTSIZE=` for unlimited size.
- Set `HISTSIZE=0` to disable bash history.
- Set `HISTSIZE=500` to limit to 500 entries.

HISTFILESIZE
Determines allowable size of .bash_history file.
- Set `HISTFILESIZE=` for unlimited file size.
- Set `HISTFILESIZE=0` to disable file size.
- Set `HISTFILESIZE=500` to limit file size to 500.

EDITOR
Changes which editor is used when Git asks for commit message.

***

## Expansion
Expansion refers to how a word is interpreted.

Bracket expansion with `{}`

Variable expansion with `$` or `${}`
`$` will expand a word as a variable. 
```sh
msg=howdy
echo msg # --> msg
echo $msg # --> howdy
```
Use `{}` when needed to avoid ambiguity. `{}` separates the variable from other things.
```sh
tree=bird
house=man
treehouse=kid
echo treehouse # --> treehouse
echo $tree # --> bird
echo $house # --> man
echo $treehouse # --> kid
echo ${tree}house # --> birdhouse
echo $tree$house # --> birdman
echo tree$house # --> treeman
```

Command substitution with `$()` or ` `` `


Single quotes `''`
- Evaluated dynamically.
- Variables are *not* evaluated inside.
- Have no value inside double quotes (e.g., `"''"`) unless escaped (`"\`"`).
- Can*not* access array inside single quotes.

Double quotes `""`
- Evaluated at time of creation. Never changes.
- Variables are expanded inside.
- Simply become literal double quotes when inside single quotes (e.g., `'""'`).
- Is interpreted when escaped inside double quotes (e.g., `"\""`).
- Can access array inside quotes.

***

## For loops
- Start with `for`.
- Declare a variable name.
- Use `;` to separate lines.
- Use `do` to start code block.
- Use `$` to expand variables.
- Use `done` to end code block.
```sh
for i in *.txt; do echo $i; done
```


## If statements
- Start with `if`.
- Use square brackets (`[]`) around the condition.
- `-z`: Length is zero. For example: `if [ -z $1 ]`
- `-n`: Length is not zero. For example: `if [ -n $1 ]`
- `$#`: Number of arguments. For example: `if [ $# -eq 0 ]` means "if there are no arguments."
- `$1`: First argument. For example: `if [ $1 ]` means "if there is a first argument."
- Use `elif` for "else if" statements.
- For both `if` and `elif`, begin the following code block with `then`.
- Use `else` for "else statements (no `then` needed).
- End loop with `fi` ("if" backwards).

Example:
```sh
if [ $typed_path = s ]
then
    echo 'server.js'
elif [ $typed_path = ss ]
then
    echo 'server/server.js'
else
    echo $typed_path
fi
```

***

## Functions
Functions gives us a lot of flexibility.
- Invoke the function by simply writing its name in the command line (no parentheses).
- Pass in arguments by simply writing in arguments after the function name (separated by spaces). For example, the following line uses a function called `hike` and passes in `'north'` for the first argument and `'south'` for the second.
```sh
hike north south
```

***

## Aliases
Aliases are alternative ways of calling something that already exists. In the example below, `g` becomes an alias of `git`. So we can now run `g add .` or `g push` instead of the full `git` commands.

```sh
alias g=git
```

***
