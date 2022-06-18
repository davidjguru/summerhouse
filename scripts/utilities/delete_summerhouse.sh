#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#-----------------------------------------------------------------------------------------
# 
# Delete Summer House
# [David Rodríguez, @davidjguru] [david.rodriguez@digitalistgroup.com]
# Title: delete_summerhouse
# Description: Disable and delete your local Summer House deploy. 
#
# davidjguru@gmail.com
# https://www.therussianlullaby.com
# https://davidjguru.github.io/
# https://dev.to/davidjguru
# https://github.com/davidjguru
#-----------------------------------------------------------------------------------------
#

# Ask for confirmation.
echo -e "   \e[1;4;31mThis script will execute a complete cleaning of the Summer House codebase in your system. \e[0m"
echo -e "   \e[1;4;31mThis script has to be executed within the original folder: /scripts/utilities. \e[0m"
read -p "Are you sure? [Y/y]" -n 1 -r
echo    # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  ## Stop DDEV and delete resources.
  yes |ddev delete -O 
  cd ../../..
  ## Delete Summer House codebase and folders.
  rm -rf summerhouse 
  echo -e "   \e[1;4;31mYour local installation of Summer House was deleted.\e[0m"
else
  echo "The execution of the script will be stopped. Bye!";
fi