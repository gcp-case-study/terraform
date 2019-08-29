#!bin/bash
sudo apt update
sudo apt upgrade
sudo apt-get -y install postgresql postgresql-client postgresql-contrib
sudo -s
sudo -u postgres psql postgres
\password postgres