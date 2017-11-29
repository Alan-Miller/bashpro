# NOTE: Some commands here use the json node package. Install with 'npm install -g json'


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#	BASH
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

alias bashprofile='open -a Visual\ Studio\ Code ~/.bash_profile'
alias bashhistory='open -a Visual\ Studio\ Code ~/.bash_history'



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#	GIT
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# type — gac 'some commit message' — to add and commit with message
gac() { 
    git add . && git commit -m "$1"
}

# type — gacp 'some commit message' — to add, commit, and push with message
gacp() { 
    git add . && git commit -m "$1" && git push
}

# type — gccd http://github.com/GitHub-Name/repository-name — to clone repo and cd in
gccd() { 
    git clone "$1" && cd "$(basename "$1")"
}

# type — gitopen — open current folder's git repo in browser
gitopen() { 
    open $(git remote show origin | grep -o -m 1 'URL: [^[:space:]]*' | sed -e 's/URL: //')
    # -o option means only grep matching string
    # -m 1 option means return only first match
}

# type — opengithub repo-name — to open repo page in browser
opengithub() { 
    open "https://github.com/Your-GitHub-Name/${1}"
}

alias g='git'
alias gaep='git add . ; git commit --allow-empty -m "empty commit" ; git push' # allow empty commit
alias garp='git add . ; git commit -m "readme edits" ; git push'
alias gpsu='git push --set-upstream origin $1' # type — gpsu branch_name
alias gdeleteorigin='git push -d origin $1'
alias gdeletelocal='git branch -d $1'
alias gdeletelocalf='git branch -D $1' # forces delete



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#	HTML
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# type — title 'Your App Name' — to retitle app
title () {
    sed -i '' "s:<title>.*<:<title>$1<:" index.html # looks for index.html at top of project folder
}

# type — retitle 'Your App Name' — to retitle app
retitle () {
    sed -i '' "s:<title>.*<:<title>$1<:" public/index.html # looks for index.html in public/ folder
}



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#	PACKAGE.JSON
#   - Edit properties in package.json
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# type — main path/to/server/file — to change this.main in package.json
main() { 
    # the following shorthand values for $1 specify common filepaths
    if [ $1 = i ]
    then
        filepath=index.js
    elif [ $1 = s ]
    then
        filepath=server.js
    elif [ $1 = si ]
    then
        filepath=server/index.js
    elif [ $1 = ss ]
    then
        filepath=server/server.js
    else
        # otherwise the value can be whatever filepath is typed
        filepath=$1
    fi
    json -If package.json -e 'this.main = "'$filepath'"'
}

# type — proxy port_number — to edit this.proxy in package.json
proxy() { 
    json -If package.json -e 'this.proxy = "http://localhost:'$1'"' 
}

# type — browser none — OR — browser browser_name — OR — browser — to set BROWSER variable
browser() { 
    # delete current BROWSER variable
    sed -i '' "s/BROWSER=[[:alnum:]]* //" package.json 
    # set $1 to none to prevent "npm start" from opening browser
    # set $1 to Firefox or Safari to set those browsers
    json -If package.json -e 'this.scripts.start = "BROWSER='$1' " + this.scripts.start'
}

# type — port #### — to edit PORT variable
port() {
    # find and delete any current PORT variable
    sed -i '' "s/PORT=.[[:alnum:]]* //" package.json 
    # add new PORT variable
    json -If package.json -e 'this.scripts.start = "PORT='$1' " + this.scripts.start' 
}



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#	REACT
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# type — cracd app_name — to run create-react-app and cd in
cracd () { 
    reactme "$1" && cd "$1" && ignoreec
}



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#	SASS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# type — sassme — to install Sass in current folder
sassme() { 
    # use bracket notation because command has issues with dot notation mixed with hyphenated properties
    npm install node-sass-chokidar && 
    json -If package.json -e 'this.scripts["build-css"] = "node-sass-chokidar src/ -o src/"' &&
    json -If package.json -e 'this.scripts["watch-css"] = "npm run build-css && node-sass-chokidar src/ -o src/ --watch --recursive"' &&
    echo -e '\n# SASS \nsrc/**/*.css'>> .gitignore && 
    npm i --save npm-run-all
    json -If package.json -e 'this.scripts["start-js"] = "react-scripts start"' &&
    json -If package.json -e 'this.scripts["start"] = "npm-run-all -p watch-css start-js"' &&
    json -If package.json -e 'this.scripts["build"] = "npm run build-css && react-scripts build"'
}