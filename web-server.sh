#!/bin/bash

## update the system
yes | sudo apt update
yes | sudo apt upgrade

## install packages
yes | sudo apt install apache2 libapache2-mod-wsgi-py3 mysql-server python3-pip 
sudo pip3 install pymysql flask

## configure apache
sudo a2enmod wsgi

sudo mv /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.orig
sudo cp 000-default.conf /etc/apache2/sites-enabled/000-default.conf

sudo mv /var/www/html/index.html /var/www/html/index.orig
sudo cp app.py /var/www/html/app.py
sudo cp app.wsgi /var/www/html/app.wsgi

## make /static and /templates directories and change ownership
sudo mkdir /var/www/html/static
sudo mkdir /var/www/html/templates

sudo chown -R www-data:www-data /var/www/html

sudo service apache2 restart

## configure mysql
sudo mysql_secure_installation
