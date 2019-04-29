# React and Rails Initial App

With this you can create initial React and Rails application automatically. It also can take care of Apache virtual host and branch creation if you desired. All these scripts should be executed in the right order and likely should be amended based on your environment and your needs. Please follow the documenation to understand the steps.

### Requirements

This works only on Centos or RHEL. You need to execute this once on particular box.

### Install dependencies on Centos

This installs node, npx, ruby and rails.

`./install_dependencies.sh`

### Understand the Usage

You will see this example in the next sections

By 'app', I mean this is your app username

By 'laimison', I mean this is your GitHub username

By 'react-rails', I mean this is your GitHub repository name for the app. So in this case origin will be 'git@github.com:laimison/react-rails.git'

By '/var/www/html/subdomain.example.com', I mean your app location. Only subdomain is allowed, it cannot be the name which is not domain and just 'example.com'

### Create an App

This creates sample React and Rails app.

`./create_app.sh app laimison react-rails /var/www/html/subdomain.example.com`

You can specify any random git user and repo if you don't need anything else what is above

### Create Apache Virtual Host

This creates a new Apache config in '/etc/httpd/conf.d'.

`./create_virtual_host.sh app laimison react-rails /var/www/html/subdomain.example.com`

### Chown

This chowns app files from root:root to app:root

`./chown.sh app laimison react-rails /var/www/html/subdomain.example.com`

### Create Crontab rules

This creates crontab rules.

`./create_crontab_rules.sh app laimison react-rails /var/www/html/subdomain.example.com`

### Create a Branch

This creates a branch.

`./create_branch.sh app laimison react-rails /var/www/html/subdomain.example.com`

### Delete the App

If you want to delete some parts, this is manual step.

If you want to delete everything automatically (delete virtual host from Apache, your branch, Crontab rule and app directory), use the script below:

`./delete_app.sh app laimison react-rails /var/www/html/subdomain.example.com`

## Preparing Workstation

### Mac

### Windows
