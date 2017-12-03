# Bash

## Variables
Bash has built-in variables. These are generally indicated in all caps. Setting these variables

***

###### PATH
Add paths for console commands.
- Enclose in single quotes.
- Start with period (```.```).
- Separate path chunks with colon (```:```).
- Finish by appending ```$PATH``` to the end.
- Set ```CDPATH=.:~/Docs:~/Music:$PATH``` to add these chunks to the path.

***

###### CDPATH
Add paths for the ```cd``` command.
- Enclose in single quotes.
- Start with period (```.```).
- Separate path chunks with colon (```:```).
- Finish by appending ```$CDPATH``` to the end.
- Set ```CDPATH=.:~/Docs:~/Music:$CDPATH``` to add these chunks to the path.

***

###### HISTSIZE
Determines allowable size of .bash_history file.
- Set ```HISTSIZE=``` for unlimited size.
- Set ```HISTSIZE=0``` to disable bash history.
- Set ```HISTSIZE=500``` to limit to 500 entries.

***

###### HISTFILESIZE
Determines allowable size of .bash_history file.
- Set ```HISTFILESIZE=``` for unlimited file size.
- Set ```HISTFILESIZE=0``` to disable file size.
- Set ```HISTFILESIZE=500``` to limit file size to 500.

***

###### EDITOR
Changes which editor is used when Git asks for commit message.

***

## Loops
- Start with ```if```.
- Use square brackets (```[]```) around the condition.
- Use ```elif``` for "else if" statements.
- For both ```if``` and ```elif```, begin the following code block with ```then```.
- Use ```else``` for "else statements (no ```then``` needed).
- End loop with ```fi``` ("if" backwards).

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
- Pass in arguments by simply writing in arguments after the function name (separated by spaces). For example, ```hike north south``` uses a function called ```hike``` and passes in ```'north'``` for the first argument and ```'south'``` for the second.

***

## Aliases
Aliases are alternative ways of calling something that already exists. In the example below, ```g``` becomes an alias of ```git```. So we can now run ```g add .``` or ```g push``` instead of the full ```git``` commands.

```sh
alias g=git
```

***

## Commands

###### sed
- ```echo``` prints.
- ```sed``` is for find and replace.
- ```json``` is for editing JSON. Before you can use it, you must install with ```npm i -g json```.
    - ```-f``` option: Edit a file. Follow this option with the name of a file you want to edit.
    - ```-I``` option: Edit in place.
    - ```-e``` Evaluate the following string as JavaScript.
    - Example: ```json -If package.json -e 'this.scripts.start = "PORT='$1' " + this.scripts.start'```