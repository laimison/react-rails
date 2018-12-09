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

# Delete crontab rule
crontab -l > ~/crontab.$RANDOM.backup.delete

if crontab -l | grep -Eq "${app_dir}.*git pull.*${sub_domain}"
then
  crontab -l | grep -Ev "${app_dir}.*git pull.*${sub_domain}" | crontab -
fi

if ! echo $? | grep -q ^0$
then
  echo "Cannot delete crontab rule"
  exit 1
fi

if crontab -l | grep -Eq "${app_dir}.*flock.*rails"
then
  crontab -l | grep -Ev "${app_dir}.*flock.*rails" | crontab -
fi

if ! echo $? | grep -q ^0$
then
  echo "Cannot delete crontab rule"
  exit 1
fi

# Stop Rails server
rails_pids=`lsof -n -i -P | grep LISTEN | grep ":${rails_port}" | awk -F ' ' '{print $2}'`
kill $rails_pids 2>/dev/null
sleep 10
kill -9 $rails_pids 2>/dev/null

# Delete (move) app dir
mv "${app_dir}" /tmp/

# Delete (move) Apache virtual host
mv /etc/httpd/conf.d/${sub_domain_full}.conf /tmp/

service httpd reload

if ! echo $? | grep -q ^0$
then
  echo "Cannot reload or start httpd server"
  exit 1
fi

# Delete a branch
if echo ${sub_domain} | grep ^master$
then
  echo "master name is not allowed to be deleted"
else
  rand=$RANDOM
  mkdir -p /tmp/remove_branch_${rand}
  cd /tmp/remove_branch_${rand}
  git init
  git checkout -b ${sub_domain}
  git remote remove origin 2>/dev/null
  git remote add origin git@github.com:${git_user}/${git_repo}.git
  git fetch origin ${sub_domain}
  git pull origin ${sub_domain}
  git push origin --delete ${sub_domain}

  if ! echo $? | grep -q ^0$
  then
    echo "Cannot delete a branch"
    exit 1
  fi
fi
