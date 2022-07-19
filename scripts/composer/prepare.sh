#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#-----------------------------------------------------------------------------------------
# 
# Review Summer House local installation to request an instal lprocess or not.
# [David Rodríguez, @davidjguru] [david.rodriguez@digitalistgroup.com]
# Title: prepare
# Description: Check if the Summer House platforma was installed previously. 
#
# davidjguru@gmail.com
# https://www.therussianlullaby.com
# https://davidjguru.github.io/
# https://dev.to/davidjguru
# https://github.com/davidjguru
#-----------------------------------------------------------------------------------------
#
# Set initial values for folders.
DIRECTORY_1=vendor
DIRECTORY_2=backend_drupal/modules/contrib
# Check if the /vendor folder exists and it's populated.
if [ -d "$DIRECTORY_1" ] && [ ! -z "$(ls -A "$DIRECTORY_1")" ] 
  then
    vendor=true
else 
  vendor=false
fi
# Check if the /modules/contrib exists and it's populated. 
if [ -d "$DIRECTORY_2" ] && [ ! -z "$(ls -A "$DIRECTORY_2")" ] 
  then
    contrib=true
else
  contrib=false
fi
# Finally only launch composer install if folders doesn't exists.
if [ "$vendor" = false ] && [ "$contrib" = false ]
  then
    composer install 
else
  echo "Folders for /modules/contrib and /vendor already exists, composer install will not be executed."
fi