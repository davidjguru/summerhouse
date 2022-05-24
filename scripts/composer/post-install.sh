#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#-----------------------------------------------------------------------------------------
# 
# Create copies of settings and service files in a Drupal installation.
# [David Rodríguez, @davidjguru] [david.rodriguez@digitalistgroup.com]
# Title: post-install
# Description: Copy settings and service files. 
#
# davidjguru@gmail.com
# https://www.therussianlullaby.com
# https://davidjguru.github.io/
# https://dev.to/davidjguru
# https://github.com/davidjguru
#-----------------------------------------------------------------------------------------
#
# Prepare the main basic settings file for installation
echo "Copying default.settings.php if no settings.php exists."
cp .settings/default.settings.php web/sites/default/settings.php
chmod 777 web/sites/default/settings.php

# Prepare the secondary settings file for installation
echo "Copying settings.ddev.php if no settings.ddev.php exists."
cp .settings/settings.ddev.php web/sites/default/settings.ddev.php
chmod 777 web/sites/default/settings.ddev.php

# Prepare the services file for installation
echo "Copying services to default folder."
cp .settings/default.services.yml web/sites/default/services.yml
chmod 777 web/sites/default/services.yml
