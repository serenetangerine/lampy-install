#!/bin/bash

## update the system
yes | sudo apt update
yes | sudo apt upgrade

## install packages 
sudo apt install apache2 libapache2-mod-wsgi mysql-server python3-pip 
sudo pip3 install pymysql flask

## configure apache
sudo a2dismod mpm_event
sudo a2enmod mpm_prefork wsgi
#sudo a2enmod cgi

sudo mv /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.orig
sudo cp 000-default.conf /etc/apache2/sites-enabled/000-default.conf

sudo mv /var/www/html/index.html /var/www/html/index.orig
sudo cp index.py /var/www/html/index.py

sudo service apache2 restart

## configure mysql
sudo mysql_secure_installation
