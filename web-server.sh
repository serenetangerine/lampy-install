#!/bin/bash

## update the system
yes | sudo apt update
yes | sudo apt upgrade

## install packages 
yes | sudo apt install apache2 libapache2-mod-wsgi mysql-server python3-pip 
sudo pip3 install pymysql flask

## configure apache
#sudo a2dismod mpm_event
#sudo a2enmod mpm_prefork cgi
sudo a2enmod wsgi

#sudo mv /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.orig
#sudo cp 000-default.conf /etc/apache2/sites-enabled/000-default.conf
sudo cp app.conf /etc/apache2/sites-available/app.conf

sudo a2ensite app.conf

sudo mv /var/www/html/index.html /var/www/html/index.orig
sudo cp app.py /var/www/html/app.py
sudo cp app.wsgi /var/www/html/app.wsgi

sudo service apache2 restart

## configure mysql
sudo mysql_secure_installation
