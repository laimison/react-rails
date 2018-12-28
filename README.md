# React-Rails

This is a simple email form based on React and Ruby on Rails.

## The Goal

* Email form with sender email address and message field

* Email address validation

* Message field is standard `textarea` component with adjustable height

* Send button with nice design applied

* Notification displayed when email sent and nice design for component

* Layout is responsive for desktop and mobile devices

* Send user's email address and message using POST to Rails

* Configure Rails mailer

* Pass `EMAIL_ADDRESS` and `EMAIL_PASSWORD` by exporting environment variables on OS

* Prepare the Rails controller to send an email, only when environment variables, user email and message are available

## Preparing Your Workstation

### Mac OS

This tutorial assums that you do not have any knowledge so if you are familiar with these tools, you can skip majority of parts

* Install Node [https://nodejs.org/en/download](https://nodejs.org/en/download)

* In Terminal `npm install -g npx` or `sudo npm install -g npx` if you don't have npx and `npx --version` is lower than version 10

* Install RVM for Ruby `curl -sSL https://get.rvm.io | bash -s stable --ruby`

* Open new Terminal and run `rvm install 2.4.5`

* `rvm use 2.4.5 --default`

* Check if you have Ruby 2.4.5 configured `ruby --version`

* `gem install rails -v 5.1.6`

* `git clone https://github.com/laimison/react-rails.git`

* `git checkout part1`

* `git pull origin part1`

* `cd react-rails/frontend`

* `npm install`

* `./start.sh`

* `cd ../backend`

* `bundle install`

* `rails --version`

* export EMAIL_ADDRESS=address_here

* export EMAIL_PASSWORD=base64_encoded_password_here

* `./start.sh`

* Check if pages are running: [http://localhost:3000](http://localhost:3000) and [http://localhost:5000](http://localhost:5000)

* Optional: if you have issues with CTRL+C when exiting programs, downgrade rvm `rvm get 1.29.3`

### Windows

This tutorial assums that you do not have any knowledge so if you are familiar with these tools, you can skip majority of parts

#### Install any editor, e.g. Atom [https://atom.io](https://atom.io)

* Do not show welcome guide if you desired

* Probably no for telemetry if asked

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

#### Install Node and npx [https://nodejs.org/en/download/](https://nodejs.org/en/download/)

* Open Git Bash

* `npm --version`

* `node --version`

* `npm install -g npx`

* `npx --version`

#### Install Yarn [https://yarnpkg.com/lang/en/docs/install/#windows-stable](https://yarnpkg.com/lang/en/docs/install/#windows-stable)

#### Install Ruby 2.4.5 x64 in this example [https://rubyinstaller.org/downloads/] (https://rubyinstaller.org/downloads/)

* Check Run 'ridk install'

* enter

* enter

### Setup Environment Variables

* Open Git Bash

* `cd`

* Open a new file `atom .bashrc`

* Add:

* `export EMAIL_ADDRESS=gmail_address_here`

* `export EMAIL_PASSWORD=base64_encoded_password_here`

* Save

#### Clone Git project and Start Rails

* You need github account for this

* Reopen Git Bash

* `cd`

* `cd Documents`

* `git clone https://github.com/laimison/react-rails.git`

* `cd react-rails/backend`

* `git checkout part1`

* `ls -lart`

* `gem install rails -v 5.1.6`

* `bundle`

* `./start.sh` - allow firewall if asked

* Check [http://localhost:5000](http://localhost:5000)

#### Install and Start React

* Open another window of Git Bash

* `cd`

* `cd Documents/react-rails/frontend`

* `yarn install`

* `./start.sh` - allow firewall if asked

* Check [http://localhost:3000](http://localhost:3000)

* You can try to send an email to you and see if it worked (check Rails output in your Git Bash window as well) :)

#### Stop everything and reset any changes to git

When did `yarn install` and `bundle`, they created some files, you want to reset them

* CTRL+C in both windows

* `cd`

* `cd Documents/react-rails`

* `git reset --hard origin/part1`

* `git fetch --all`

#### Open project in Atom

* File - add project folder - Document/react-rails

OR

* `cd; cd Documents/react-rails; atom .` in Git Bash

#### Commit Your Changes to Git

If you want to write some changes to this repository, you should be added as collaborator for this project

Option 1) ideally ask me to give you access

Option 2) fork this repo

`partX` - can be any part that you want to change

* Open another window of Git Bash

* `cd`

* `cd Documents/react-rails`

* `git config user.name "Your Name or nickname"` - this name will be visible to the world.. surname is not required..

* `git config user.email "your_github_email_address@example.com"` - it's not visible to anyone

* `git checkout partX`

* Make sure that you have started frontend and probably backend with `./start.sh`

* If not able to start you may need to install packages `yarn install` from frontend directory and `bundle` from backend directory

* Now you can try to edit some text and check [http://localhost:3000](http://localhost:3000)

* So if you are happy with local changes, push them to git!

* `git status`

* `git add --all`

* `git commit -m 'add some message what you have changed'` - this is visible to the world

* `git push origin partX` - it will ask for your Github username and password

#### Git Commit in One Line

Add this function to your user's profile

``grep -qE 'git_push.*().*{' ~/.bash_profile || echo 'git_push () { git status && echo && echo $* | grep [a-zA-Z] && echo "Pushing as `git config user.name` in 5 seconds (CTRL+C to decline) ..." && sleep 5 && git config --global push.default current && git add --all && git commit -m "$*" && git push ; }' >> ~/.bash_profile``

Reopen your terminal and try it

You should be in react-rails directory

`git_push your commit message here`

You can replace "your commit message here" with any message, but special characters are not recommended unless this is comma or point ,.

