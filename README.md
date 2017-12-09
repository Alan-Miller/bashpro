# Bash

## Basic ommands

`ls` &nbsp; List files in the active folder.

options:
```sh
-a  # hidden files, too
-l  # details
-r  # reverse
-S  # order by file size
-t  # order by file time
```

`cd` &nbsp; Navigate to other files.

possible paths:
    ```sh
    .  # current directory
    .. # parent directory
    -  # previous folder
    /  # start at root folder
    ~  # start at home folder
    ```

###### files: &nbsp; `touch` and `rm`
- To make a file, use `touch` and a file name.
- To remove a file, use `rm` and a file name.
- optional file names: 
    - `*` &nbsp; all files
- options:
    - `-r` &nbsp; recursive
    - `-f` &nbsp; force

###### folders: &nbsp; `mkdir` and `rmdir`
- To make a file, use `mkdir` and a folder name.
- To remove an empty file, use `rmdir` and a folder name.
- To remove a folder and all files and subfolders, use `rm -rf` and a folder name.
- For example:
```sh
rm -rf ./Folder_Full_of_Files
```

`;` &nbsp; runs one command and then another. With the commands below, the second will try to run regardless of whether the first succeeded or failed.
```sh
touch example.txt ; nano example.txt
```
`&&` &nbsp; runs one command after another only if the first one runs without any errors. With the commands below, the second will only proceed if the first was successful.
```sh
touch example.txt && nano example.txt
```

↑ &nbsp; Populate the command line with the previous command.

`sudo` &nbsp; Use admin credentials to run commands that require permission.

`history` &nbsp; See your bash history (i.e., the contents of ~/.bash_history).

***

###### print: &nbsp; `echo`
- To print something, use `echo`.

###### concat: &nbsp; `cat`
- To show contents of one or more files, use `cat` and one or more file paths.
- For example:
```sh
cat employee1.txt employee2.txt
```

###### more and less: &nbsp; `more` and `less`
- To show contents one screen at a time, use `more` or `less` and one or more file names.

###### substitute: &nbsp; `^`
- To swap out part of the previous command for something else, use `^` with the part to swap out and another   `^` with the part to swap in.
- For examples, if you make a typo in a long command and don't want to retype the whole command, replace the typo with the correction using `^`.
```sh
mr ~/Desktop/fotos/holidays/Thanksgiving/pre-dinner-bash/IMG_7477.jpg
```
```sh
^mr^rm
```

###### redirect: &nbsp; `>`, `<`, and `|`
- To redirect the output of a command to a file or stream, use `>` between the command and the file name.
```sh
pg_dump mydb > mydb_bkup.sql
```
- To run a command with the contents of a file, use `<` between the command and the file name.
```sh
somecommand < temp_file
```
- To pipe output from one command to another command, use `|`.
```sh
ls -al | more
```

###### find and replace: &nbsp; `sed`

- `sed` is for find and replace.

###### edit JSON: &nbsp; `json`
- `json` is for editing JSON. Before you can use it, you must install with `npm i -g json`.
    - `-f` option: Edit a file. Follow this option with the name of a file you want to edit.
    - `-I` option: Edit in place.
    - `-e` Evaluate the following string as JavaScript.
    - Example: `json -If package.json -e 'this.scripts.start = "PORT='$1' " + this.scripts.start'`


***

## Variables
Bash has built-in variables. These are generally indicated in all caps. Setting these variables

###### PATH
Add paths for console commands.
- Enclose in single quotes.
- Start with period (`.`).
- Separate path chunks with colon (`:`).
- Finish by appending `$PATH` to the end.
- Set `CDPATH=.:~/Docs:~/Music:$PATH` to add these chunks to the path.

###### CDPATH
Add paths for the `cd` command.
- Enclose in single quotes.
- Start with period (`.`).
- Separate path chunks with colon (`:`).
- Finish by appending `$CDPATH` to the end.
- Set `CDPATH=.:~/Docs:~/Music:$CDPATH` to add these chunks to the path.

###### HISTSIZE
Determines allowable size of .bash_history file.
- Set `HISTSIZE=` for unlimited size.
- Set `HISTSIZE=0` to disable bash history.
- Set `HISTSIZE=500` to limit to 500 entries.

###### HISTFILESIZE
Determines allowable size of .bash_history file.
- Set `HISTFILESIZE=` for unlimited file size.
- Set `HISTFILESIZE=0` to disable file size.
- Set `HISTFILESIZE=500` to limit file size to 500.

###### EDITOR
Changes which editor is used when Git asks for commit message.

***

## Expansion
Expansion refers to how a word is interpreted.

###### Bracket expansion with `{}`

###### Variable expansion with `$` or `${}`
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

###### Command substitution with `$()` or ` `` `


###### Single quotes `''`
- Evaluated dynamically.
- Variables are *not* evaluated inside.
- Have no value inside double quotes (e.g., `"''"`) unless escaped (`"\`"`).
- Can*not* access array inside single quotes.

###### Double quotes `""`
- Evaluated at time of creation. Never changes.
- Variables are expanded inside.
- Simply become literal double quotes when inside single quotes (e.g., `'""'`).
- Is interpreted when escaped inside double quotes (e.g., `"\""`).
- Can access array inside quotes.

***

## Loops
- Start with `if`.
- Use square brackets (`[]`) around the condition.
- `-z`: Length is zero. For example: `if [ -z $1 ]`
- `-n`: Length is not zero. For example: `if [ -n $1 ]`
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
- Pass in arguments by simply writing in arguments after the function name (separated by spaces). For example, `hike north south` uses a function called `hike` and passes in `'north'` for the first argument and `'south'` for the second.

***

## Aliases
Aliases are alternative ways of calling something that already exists. In the example below, `g` becomes an alias of `git`. So we can now run `g add .` or `g push` instead of the full `git` commands.

```sh
alias g=git
```
