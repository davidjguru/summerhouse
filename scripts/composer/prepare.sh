#!/bin/sh
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
# Set initial values for folders and variables.
DIRECTORY_1=vendor
DIRECTORY_2=backend_drupal/modules/contrib
VENDOR=false CONTRIB=false INSTALLED=false

# Check if the /vendor folder exists and it's populated.
if [ -d "$DIRECTORY_1" ] && [ ! -z "$(ls -A "$DIRECTORY_1")" ] 
  then
    VENDOR=true
fi

# Check if the /modules/contrib exists and it's populated. 
if [ -d "$DIRECTORY_2" ] && [ ! -z "$(ls -A "$DIRECTORY_2")" ] 
  then
    CONTRIB=true
fi

# Check if the Drupal installation was enabled previously.
if [ "$(drush status bootstrap)" = "Drupal Bootstrap: Successful" ]
  then
    INSTALLED=true
fi

# Finally check every possible scenario.
if [ "$VENDOR" = true ] && [ "$CONTRIB" = true ] && [ "$INSTALLED" = true ]
  ## First: Running Summer House after ddev stop with all resources existing.
  then
    echo "Folders for /modules/contrib and /vendor already exists and Drupal installation is enabled, composer install or drush will not be executed."
elif [ "$VENDOR" = true ] && [ "$CONTRIB" = true ] && [ "$INSTALLED" = false ]
  ## Second: Running Summer House after deletion of containers maintaining codebase.
  then
    echo "Folders for /modules/contrib and /vendor already exists but Drupal installation is not enabled, drush site:install will be executed."
    drush site-install --existing-config --site-name=SummerHouse --account-name=admin --account-pass=admin --db-url=mysql://db:db@db/db -y
    drush user-add-role 'administrator' admin
    yes |drush cset system.site uuid $(head -n 1 ./.settings/salt.txt)
    drush cr
    drush genc --bundles=article 10
else
  ## Third: First time Installation running ddev start.
  echo "Folders for /modules/contrib and /vendor doesn't exists and your Drupal installation is not enabled, composer install and drush will be executed."
  composer install 
  drush site-install --existing-config --site-name=SummerHouse --account-name=admin --account-pass=admin --db-url=mysql://db:db@db/db -y
  drush user-add-role 'administrator' admin
  yes |drush cset system.site uuid $(head -n 1 ./.settings/salt.txt)
  drush cr
  drush genc --bundles=article 10
fi