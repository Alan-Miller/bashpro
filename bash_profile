# NOTE: Some commands here use the json node package. Install with 'npm install -g json'


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#	BASH
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

alias bashprofile='open -a Visual\ Studio\ Code ~/.bash_profile'
alias bashhistory='open -a Visual\ Studio\ Code ~/.bash_history'



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#	GIT
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

gac() {
     git add . && git commit -m "$1"
}

gacp() {
     git add . && git commit -m "$1" && git push
}

gccd() {
  git clone "$1" && cd "$(basename "$1")"
}

gitopen() {
    # open current git repo in browser
    open $(git remote show origin | grep -o -m 1 'URL: [^[:space:]]*' | sed -e 's/URL: //')
    # -o option means only grep matching string
    # -m 1 option means return only first match
}

opengithub() {
    open "https://github.com/Your-GitHub-Name/${1}"
}

alias garp='git add . ; git commit -m "readme edits" ; git push'
alias gpsu='git push --set-upstream origin $1'
alias gdeleteorigin='git push -d origin $1'
alias gdeletelocal='git branch -d $1'
alias gdeletelocalf='git branch -D $1' #force



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#	HTML
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

title () {
    # retitle apps where index.html is at top of project folder
    sed -i '' "s:<title>.*<:<title>$1<:" index.html
}

retitle () {
    # retitle React apps index.html is in public/ folder
    sed -i '' "s:<title>.*<:<title>$1<:" public/index.html
}



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#	PACKAGE.JSON
#   - Edit properties in package.json
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

main() {
    # $1 can use shorthand below to specify common filepaths
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
        # otherwise $1 can spell out a different filepath
        filepath=$1
    fi
    json -If package.json -e 'this.main = "'$filepath'"'
}

proxy() {
    json -If package.json -e 'this.proxy = "http://localhost:'$1'"' 
}

browser() {
    #Find and delete any current BROWSER variable
    sed -i '' "s/BROWSER=[[:alnum:]]* //" package.json 
    #Add new BROWSER variable
    json -If package.json -e 'this.scripts.start = "BROWSER='$1' " + this.scripts.start' 
}

port() {
    #Find and delete any current PORT variable
    sed -i '' "s/PORT=.[[:alnum:]]* //" package.json 
    #Add new PORT variable
    json -If package.json -e 'this.scripts.start = "PORT='$1' " + this.scripts.start' 
}



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#	REACT
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

cracd () {
    # run create-react-app and then cd into app
    reactme "$1" && cd "$1" && ignoreec
}



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#	SASS
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

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