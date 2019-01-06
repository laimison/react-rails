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

# Rewrite git URL, basically use another repository instead of Github
if ! echo "${5}" | grep -q ^$
then
  echo "Rewriting git URL so github will not be used ... continue in 5 seconds"
  sleep 5
  git_url="${5}"
  echo "Your git url is ${git_url}"
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

# Create a branch
rm -rf ${app_dir}/frontend/.git
cd ${app_dir}
git init
git checkout -b ${sub_domain}
git remote remove origin 2>/dev/null

if echo "$git_url" | grep ^$
then
  git remote add origin git@github.com:${git_user}/${git_repo}.git
else
  git remote add origin "$git_url"
fi

git add --all
git commit -m "initial app"
git push origin ${sub_domain}

if ! echo $? | grep -q ^0$
then
  echo "Cannot create a branch"
  exit 1
fi
