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
# Set initial values for folders and variables.
DIRECTORY_1=vendor
DIRECTORY_2=backend_drupal/modules/contrib
BIN=vendor/bin/drush
VENDOR=false CONTRIB=false INSTALLED=true

# Check if the /vendor folder exists and it's populated.
if [ -d "$DIRECTORY_1" ] && [ ! -z "$(ls -A "$DIRECTORY_1")" ] 
  then
    VENDOR=true
    echo "The /vendor folder is available in your system and it was populated."
else
  echo "The /vendor folder is not available in your system."
fi

# Check if the /modules/contrib exists and it's populated. 
if [ -d "$DIRECTORY_2" ] && [ ! -z "$(ls -A "$DIRECTORY_2")" ] 
  then
    CONTRIB=true
    echo "The /modules/contrib/ folder is available in your system and it was populated."
else 
  echo "The /modules/contrib/ folder is not available in your system."
fi

# Check if the Drupal installation was enabled previously.
if [ "$VENDOR" = false ] || [ ! -e "$BIN" ] || [ -z "$(vendor/bin/drush status bootstrap)" ]
  then
    INSTALLED=false
    echo "Summer House was not installed in your local environment."
    echo $DIRECTORY_3
else 
  echo "Summer House was already installed in your local environment."
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
    vendor/bin/drush site-install --existing-config --site-name=SummerHouse --account-name=admin --account-pass=admin --db-url=mysql://db:db@db/db -y
    vendor/bin/drush user-add-role 'administrator' admin
    yes 2>/dev/null |vendor/bin/drush cset system.site uuid $(head -n 1 .settings/salt.txt)
    vendor/bin/drush cr
    vendor/bin/drush genc --bundles=article 10
else
  ## Third: First time Installation running ddev start.
  echo "Folders for /modules/contrib and /vendor doesn't exist and your Drupal installation is not enabled, composer install and drush will be executed."
  composer install 
  vendor/bin/drush site-install --existing-config --site-name=SummerHouse --account-name=admin --account-pass=admin --db-url=mysql://db:db@db/db -y
  vendor/bin/drush user-add-role 'administrator' admin
  yes 2>/dev/null |vendor/bin/drush cset system.site uuid $(head -n 1 .settings/salt.txt)
  vendor/bin/drush cr
  vendor/bin/drush genc --bundles=article 10
fi
