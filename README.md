# React-Rails

## Preparing Your Workstation

### Mac OS

This tutorial assumes that you do not have any knowledge so if you are familiar with these tools, you can skip majority of parts

#### Will be added more steps

...

### Windows

This tutorial assumes that you do not have any knowledge so if you are familiar with these tools, you can skip majority of parts

#### Install any editor, e.g. Atom [https://atom.io](https://atom.io)

* Do not show welcome guide if you desired

* Probably no for telemetry if asked

#### Open project in Atom

* File - add project folder - Document/react-rails

OR

* `cd; cd Documents/react-rails; atom .` in Git Bash

#### Will be added more steps

...

#### Install Git Bash [https://git-scm.com/download/win](https://git-scm.com/download/win)

* During installation choose nano editor if you need a simple one

* Choose git from the command line and also from 3rd-party software

* Use OpenSSH

* Check OpenSSL

* Yes for checkout Windows-style, commit Unix-style line endings

* Use MinTTY

* Enable file system caching

* Enable Git Credential Manager

* Enable symbolic links

### GIT Basics

#### Clone GIT project

* You need github account for this

* Open Git Bash

* `cd; cd Documents`

* `git clone https://github.com/laimison/react-rails.git`

* `cd react-rails`

* `git checkout part1`

#### Reset any changes in your local GIT

* `cd; cd Documents/react-rails`

* `git reset --hard origin/part1`

* `git fetch --all`

#### Commit Your Changes to GIT

If you want to write some changes to this repository, you should be added as collaborator for this project

Option 1) ideally ask owner to give the access

Option 2) fork this repo

`partX` - can be any part that you want to change

* Open another window of Git Bash

* `cd`

* `cd Documents/react-rails`

* `git config user.name "Your Name or nickname"` - this name will be visible to the world.. surname is not required..

* `git config user.email "your_github_email_address@example.com"` - it's not visible to anyone

* `git checkout partX`

* Now you can try to edit some code and push them to git!

* `git status`

* `git add --all`

* `git commit -m 'add some message what you have changed'` - this is visible to the world

* `git push origin partX` - it will ask for your Github username and password

#### GIT Commit in One Line (Optional)

Type this in Git Bash

``cd; grep -qE 'git_push.*().*{' ~/.bash_profile || echo 'git_push () { git status && echo && echo $* | grep [a-zA-Z] && echo "Pushing as `git config user.name` in 5 seconds (CTRL+C to decline) ..." && sleep 5 && git config --global push.default current && git add --all && git commit -m "$*" && git push ; }' >> .bashrc``

Reopen your Git Bash window

You should be in react-rails directory

`git_push your "commit message here"`
