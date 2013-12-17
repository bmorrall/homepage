#!/usr/bin/env bash

PROJECT_DIR="/webapps/benmorrall.local"
LOCALE="en_AU.UTF-8"

# Setup Locale to en_AU.UTF-8
echo "export LANGUAGE=\"${LOCALE}\"" > /etc/profile.d/lang.sh
echo "export LANG=\"${LOCALE}\"" >> /etc/profile.d/lang.sh
echo "export LC_ALL=\"${LOCALE}\"" >> /etc/profile.d/lang.sh
chmod +x /etc/profile.d/lang.sh
source /etc/profile.d/lang.sh

apt-get update

# Install build essentials
apt-get install -y build-essential git-core libcurl4-openssl-dev

# Install dev essentials
apt-get install -y vim

# Install Apache
apt-get install -y apache2 apache2-mpm-prefork apache2-prefork-dev
a2enmod expires
a2enmod headers
a2enmod rewrite

# Install PostgresSQL (pg)
apt-get install -y postgresql postgresql-contrib libpq-dev
sudo -u postgres createuser --createdb --no-adduser --no-createrole --login -e vagrant
sudo -u postgres createdb -O vagrant -e benmorrall_development
sudo -u postgres createdb -O vagrant -e benmorrall_test

# Install Node.js (execjs)
apt-get install -y nodejs

# Install QT (capybara-webkit)
apt-get install -y libqt4-dev xvfb

# Install rbenv
git clone git://github.com/sstephenson/rbenv.git /usr/local/rbenv

# Add rbenv to the path
echo '# rbenv setup' > /etc/profile.d/rbenv.sh
echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
 
chmod +x /etc/profile.d/rbenv.sh
source /etc/profile.d/rbenv.sh

# Install Phusion Passenger
gem install passenger -v '4.0.29'
rbenv rehash
passenger-install-apache2-module --auto

sudo bash -c "cat >> /etc/apache2/apache2.conf <<PASSENGER

# Include Phusion Passenger
LoadModule passenger_module /usr/local/rbenv/versions/1.9.3-p484/lib/ruby/gems/1.9.1/gems/passenger-4.0.29/buildout/apache2/mod_passenger.so
PassengerRoot /usr/local/rbenv/versions/1.9.3-p484/lib/ruby/gems/1.9.1/gems/passenger-4.0.29
PassengerDefaultRuby /usr/local/rbenv/versions/1.9.3-p484/bin/ruby
PASSENGER"

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

# Setup xvfb (headerless testing)
cp $PROJECT_DIR/etc/vagrant/init_d_xvfb /etc/init.d/xvfb
chmod 755 /etc/init.d/xvfb

# Setup the project
pushd $PROJECT_DIR
  bundle install
  touch tmp/restart.txt
popd

# Create the apache config
cp $PROJECT_DIR/etc/apache/benmorrall.local /etc/apache2/sites-available/benmorrall.local

# Reload Apache
a2dissite 000-default
a2ensite benmorrall.local
service apache2 reload

# Add Apache to System init scripts
# update–rc.d apache2 defaults
