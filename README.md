# Bash

## Variables
Bash has built-in variables. These are generally indicated in all caps. Setting these variables

###### PATH
Add paths for console commands.
- Enclose in single quotes.
- Start with period (```.```).
- Separate path chunks with colon (```:```).
- Finish by appending ```$PATH``` to the end.
- Set ```CDPATH=.:~/Docs:~/Music:$PATH``` to add these chunks to the path.

###### CDPATH
Add paths for the ```cd``` command.
- Enclose in single quotes.
- Start with period (```.```).
- Separate path chunks with colon (```:```).
- Finish by appending ```$CDPATH``` to the end.
- Set ```CDPATH=.:~/Docs:~/Music:$CDPATH``` to add these chunks to the path.

###### HISTSIZE
Determines allowable size of .bash_history file.
- Set ```HISTSIZE=``` for unlimited size.
- Set ```HISTSIZE=0``` to disable bash history.
- Set ```HISTSIZE=500``` to limit to 500 entries.

###### HISTFILESIZE
Determines allowable size of .bash_history file.
- Set ```HISTFILESIZE=``` for unlimited file size.
- Set ```HISTFILESIZE=0``` to disable file size.
- Set ```HISTFILESIZE=500``` to limit file size to 500.

###### EDITOR
Changes which editor is used when Git asks for commit message.

## Aliases
Aliases are alternative ways of calling something that already exists. In the example below, ```g``` becomes an alias of ```git```. So we can now run ```g add .``` or ```g push``` instead of the full ```git``` commands.

```sh
alias g=git
```

### Function
Functions gives us a lot of flexibility.