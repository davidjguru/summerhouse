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

## Stop DDEV and delete resources.
yes |ddev delete -O 
cd ../../..
## Delete Summer House codebase and folders.
rm -rf summerhouse 
echo -e "   \e[1;4;31mYour local installation of Summer House was deleted.\e[0m"