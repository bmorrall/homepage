#!/usr/bin/env bash

PROJECT_DIR="/webapps/benmorrall.local"

apt-get update

# Install build essentials
apt-get -y install build-essential git-core

# Install dev essentials
apt-get install -y vim

# Install rbenv
git clone git://github.com/sstephenson/rbenv.git /usr/local/rbenv
 
# Add rbenv to the path
echo '# rbenv setup' > /etc/profile.d/rbenv.sh
echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
 
chmod +x /etc/profile.d/rbenv.sh
source /etc/profile.d/rbenv.sh

# Install ruby-build
pushd /tmp
  git clone git://github.com/sstephenson/ruby-build.git
  cd ruby-build
  ./install.sh
popd
 
# Install Ruby 1.9.3-p484
rbenv install 1.9.3-p484
rbenv global 1.9.3-p484

# Rehash
rbenv rehash

# Install Bundler
gem install bundler
rbenv rehash

# Setup Directories
mkdir /webapps
ln -fs /vagrant $PROJECT_DIR

# Setup the project
pushd $PROJECT_DIR
  bundle install
  touch tmp/restart.txt
popd
