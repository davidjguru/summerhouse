#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#-----------------------------------------------------------------------------------------
# 
# Install and enable PHPUnit testing in your Drupal Installation.
# [David Rodríguez, @davidjguru] [david.rodriguez@digitalistgroup.com]
# Title: enable_phpunit_testing
# Description: Build up testing with PHPUnit in Summer House sandbox. 
#
# davidjguru@gmail.com
# https://www.therussianlullaby.com
# https://davidjguru.github.io/
# https://dev.to/davidjguru
# https://github.com/davidjguru
#-----------------------------------------------------------------------------------------
#

# Ask for confirmation.
echo -e "   \e[1;4;31mThis script will install some extra dependencies and execute changes in some files of Summer House codebase. \e[0m"
echo -e "   \e[1;4;31mThis script has to be executed within the original folder: /scripts/utilities. \e[0m"
read -p "Are you sure? [Y/y]" -n 1 -r
echo    # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  # Disabling XDebug in your local DDEV deploy.
  echo -e "   \e[1;4;31mDisabling XDebug in your system. \e[0m"
  ddev xdebug off

  # Come back to the project main folder.
  cd ../..
  string_url="<env name='BROWSERTEST_OUTPUT_BASE_URL' value='http://summerhouse.ddev.site/'/>"

  # Installing the required resources for testing.
  echo -e "   \e[1;4;31mWe're installing the required resources for testing. \e[0m"
  ddev composer require --dev phpunit/phpunit symfony/phpunit-bridge \
                              behat/mink-goutte-driver behat/mink-selenium2-driver \
                              phpspec/prophecy-phpunit --with-all-dependencies

  # Altering the config values in specific lines of the phpunit file.
  echo -e "   \e[1;4;31mExecuting changes in config files for PHPUnit. \e[0m"
  cd backend_drupal/core
  cp phpunit.xml.dist phpunit.xml
  sed -i 's+<env name="SIMPLETEST_BASE_URL" value=""/>+<env name="SIMPLETEST_BASE_URL" value="http://localhost"/>+g' phpunit.xml
  sed -i 's+<env name="SIMPLETEST_DB" value=""/>+<env name="SIMPLETEST_DB" value="mysql://db:db@db/db"/>+g' phpunit.xml
  sed -i 's+<env name="BROWSERTEST_OUTPUT_DIRECTORY" value=""/>+<env name="BROWSERTEST_OUTPUT_DIRECTORY" value="/var/www/html/backend_drupal/sites/default/simpletest/"/>+g' phpunit.xml
  sed -i 's+<env name="BROWSERTEST_OUTPUT_BASE_URL" value=""/>+'"$string_url"'+g' phpunit.xml
  cd ../..
  
  # Check if PHPUnit was enabled.
  echo -e "   \e[1;4;31mLaunching internal test of the admin_toolbar module as example. \e[0m"
  ddev exec ./vendor/bin/phpunit -c backend_drupal/core /var/www/html/backend_drupal/modules/contrib/admin_toolbar

  # Enabling XDebug in your local DDEV deploy.
  echo -e "   \e[1;4;31mEnabling XDebug in your system. \e[0m"
  ddev xdebug on
else
  echo "The execution of the script will be stopped. Bye!";
fi