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

# Create React app
npx create-react-app "${app_dir}/frontend"

if ! echo $? | grep -q ^0$
then
  echo "React profile failed to create"
  exit 1
fi

cd "${app_dir}/frontend"
npm run build

# Create Rails app
mkdir -p "${app_dir}/backend"
cd "${app_dir}/backend"

if ! echo $? | grep -q ^0$
then
  echo "Cannot change the directory so it should fail"
  exit 1
fi

echo "source 'https://rubygems.org'" > Gemfile
echo "gem 'rails', '~> 5.1.6'" >> Gemfile
# -T to exclude Minitest because we are going to use RSpec
bundle exec rails new . --api --force --skip-bundle -T && bundle install && rails db:migrate

if ! echo $? | grep -q ^0$
then
  echo "Rails profile failed to create"
  exit 1
fi

echo "Your app created at ${app_dir}"
