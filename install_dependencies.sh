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

# Require node 8 or higher
if ! node --version | tr -d [a-zA-Z] | grep -Eq '^([8-9]|[0-9][0-9])\.'
then
  echo "Node 8 or higher needed. Removing old node and installing new ... You have 10 seconds to abort this and review the script"
  sleep 10
  yum remove npm nodejs -y
  /bin/rm -rf /var/cache/yum
  /bin/rm /etc/yum.repos.d/nodesource*
  /usr/bin/yum clean all

  /usr/bin/curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -
  yum install nodejs -y

  if ! which node | grep -q node$
  then
    echo "node installation failed"
    exit 1
  fi
fi

# Require npx 10 or higher
if ! npx --version 2>/dev/null | tr -d [a-zA-Z] | grep -Eq '^([0-9][0-9])\.'
then
  echo "npx 10 or higher needed. Installing npx ... You have 10 seconds to abort this and review the script"
  sleep 10
  npm i -g npx

  if ! which npx | grep -q npx$
  then
    echo "npx installation failed"
    exit 1
  fi
fi

# Install Ruby
if ! ruby --version 2>/dev/null | tr -d ' [a-zA-Z]' | grep -Eq '^2\.[4-9]'
then
  yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel \
  libyaml-devel libffi-devel openssl-devel make \
  bzip2 autoconf automake libtool bison iconv-devel sqlite-devel

  curl -sSL https://rvm.io/mpapis.asc | gpg --import -
  source /etc/profile.d/rvm.sh
  rvm reload
  rvm requirements run
  rvm install 2.4.5
  rvm use 2.4.5 --default
  ruby --version

  # switching to older version because of CTRL+C bug related with /etc/profile.d/rvm.sh - https://github.com/rvm/rvm/issues/4422
  rvm get 1.29.3

  if ! which ruby | grep -q ruby$
  then
    echo "ruby installation failed"
    exit 1
  fi
fi

# Install Rails
if ! rails --version | tr -d ' [a-zA-Z]' | grep -Eq '^5\.'
then
  yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel git

  yum install -y rubygems
  gem install rails -v 5.1.6

  if ! rails --version | tr -d ' [a-zA-Z]' | grep -Eq '^5\.'
  then
    echo "rails installation failed"
    exit 1
  fi
fi

echo "Seems you have all required dependencies now!"
