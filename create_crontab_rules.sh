#!/bin/bash

# Allow only Centos and RHEL
if ! which yum 2>/dev/null | grep -q yum$
then
  echo "This script is compatible only with Centos and RHEL"
fi

# The script is designed to be executed from root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

# Initialize app user
if echo "${1}" | grep -q ^$
then
  echo "Please provide enough arguments"
  exit 1
else
  app_user=${1}
fi

# Initialize github user
if echo "${2}" | grep -q ^$
then
  echo "Please provide enough arguments"
  exit 1
else
  git_user=${2}
fi

# Initialize github repo
if echo "${3}" | grep -q ^$
then
  echo "Please provide enough arguments"
  exit 1
else
  git_repo=${3}
fi

# Initialize app_dir
if echo "${4}" | grep -q ^$
then
  echo "Please provide enough arguments"
  exit 1
else
  sub_domain=`echo ${4} | awk -F '/' '{print $NF}' | awk -F '.' '{print $1}'`
  sub_domain_full=`echo ${4} | awk -F '/' '{print $NF}'`
  app_dir=${4}
fi

# Initialize rails port
rails_port=`echo ${sub_domain} | sha1sum | tr -dc '0-9' | cut -c1-4 | sed -e "s/^/3/g"`

# Initialize main IP
ip=`hostname -I | awk -F ' ' '{print $1}'`

echo "Your git username is ${git_user}"
echo "Your git repo is ${git_repo}"
echo "Your subdomain is ${sub_domain_full}"
echo "Your rails port is ${rails_port}"
echo "Your main ip is ${ip}"
echo "Your app username is ${app_user}"

echo "The script will do the changes in 10 seconds ..."
sleep 10

# ---- ----
# Beginning
# ---- ----

# Create crontab rules
crontab -l > ~/crontab.$RANDOM.backup

crontab -l | grep -Eq "${app_dir}.*git pull.*${sub_domain}" || (crontab -l 2>/dev/null; echo "*/1 * * * * source \$HOME/.bash_profile && cd ${app_dir} && /usr/bin/git reset --hard && ! /usr/bin/git pull -f origin ${sub_domain} | grep '^Already up-to-date' && cd frontend && /usr/bin/npm install && /usr/bin/npm run build && cd build/static/js && for f in \`ls\`; do /usr/bin/sed -ie 's|localhost\:5000|api.${sub_domain_full}|g' \$f; done") | crontab -

if ! echo $? | grep -q ^0$
then
  echo "Cannot update crontab for git pull"
  exit 1
fi

crontab -l | grep -Eq "${app_dir}.*flock.*rails" || (crontab -l 2>/dev/null; echo "*/1 * * * * /usr/bin/su ${app_user} /bin/bash -l -c \"source \\$HOME/.bash_profile && source /etc/profile.d/rvm.sh && rvm use ruby-2.4.5 && cd ${app_dir}/backend && /usr/bin/flock -n /tmp/api.${sub_domain_full}.lockfile /usr/local/rvm/gems/ruby-2.4.5/bin/rails s -p ${rails_port} -b 0.0.0.0\"") | crontab -

if ! echo $? | grep -q ^0$
then
  echo "Cannot update crontab for rails"
  exit 1
fi

echo "Rules created"
