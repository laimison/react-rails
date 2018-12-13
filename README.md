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

* `export EMAIL_ADDRESS=address_here`

* `export EMAIL_PASSWORD=base64_encoded_password_here`

* Save

#### Clone Git project and Start React

* Reopen Git Bash

* `cd`

* `cd Documents`

* `git clone https://github.com/laimison/react-rails.git`

* `cd react-rails`

* `git checkout part1`

* `ls -lart`

* `cd frontend`

* `yarn install`

* `./start.sh` - allow firewall if asked

* Check [http://localhost:3000](http://localhost:3000)

#### Install and Start Rails

* Open another window of Git Bash

* `gem install rails -v 5.1.6`

* `cd`

* `cd Documents/react-rails/backend`

* `bundle`

* `./start.sh` - allow firewall if asked

* Check [http://localhost:5000](http://localhost:5000)

#### Open Project in Atom

* File - add project folder - Document/react-rails

* You can try to edit some text and check [http://localhost:5000](http://localhost:5000)

#### Commit Your Changes to Git

* Open another window of Git Bash

* `cd`

* `cd Documents/react-rails`

* `git status`

* `git add --all`

* `git commit -m 'first commit'`

* `git push origin part1` - it will ask for your Github username and password
