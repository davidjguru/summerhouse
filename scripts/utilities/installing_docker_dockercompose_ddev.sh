#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#-----------------------------------------------------------------------------------------
# 
# Install Docker, Docker-Compose and DDEV in Ubuntu.
# [David Rodríguez, @davidjguru] [david.rodriguez@digitalistgroup.com]
# Title: installing_docker_dockercompose_ddev
# Description: Install the last available versions for Docker, Docker-Compose and DDEV. 
#
# davidjguru@gmail.com
# https://www.therussianlullaby.com
# https://davidjguru.github.io/
# https://dev.to/davidjguru
# https://github.com/davidjguru
#-----------------------------------------------------------------------------------------
#

# Ask for confirmation.
echo -e "   \e[1;4;31mThis script will execute important changes in your system. \e[0m"
echo -e "   \e[1;4;31mThese changes can be dangerous. Please, consider another isolation layer, like VirtualBox. \e[0m"
read -p "Are you sure? [Y/y]" -n 1 -r
echo    # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  ## Update the list of packages.
  echo -e "   \e[1;4;31mUpdate the package list: \e[0m"
  sudo apt  update


  # Install some basic resources in your System (Ubuntu).
  echo -e "   \e[1;4;31mInstalling some basic resources for your system: \e[0m"
  sudo apt install -y build-essential apt-transport-https ca-certificates jq curl software-properties-common file git  gnupg-agent

  # Install Docker.
  echo -e "   \e[1;4;31mInstalling Docker from the Docker repository... \e[0m"
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt update
  sudo apt install -y docker-ce docker-ce-cli containerd.io

  # Enable Docker.
  echo -e "   \e[1;4;31mEnabling Docker Engine...\e[0m"
  sudo systemctl unmask docker
  sudo systemctl start docker
  sudo systemctl enable --now docker

  # Add the current user to the Docker group.
  echo -e "   \e[1;4;31mAdding your current user to the new Docker group.\e[0m"
  sudo usermod -aG docker $USER

  # Grant permissions over the Docker system for users.
  echo -e "   \e[1;4;31mGrants permissions over the Docker system.\e[0m"
  sudo chmod 666 /var/run/docker*

  # Test if Docker is running or not.
  echo -e "   \e[1;4;31mDocker has been installed in your system. Currently Docker is: \e[0m"
  systemctl is-active docker

  # Check if Docker is ready.
  echo -e "   \e[1;4;31mThis is your current Docker version: \e[0m"
  docker --version

  # Verifies Docker running.
  echo -e "   \e[1;4;31mWe're running a Docker initial testing - hello world -> \e[0m"
  docker run hello-world

  # Install Docker Compose.
  echo -e "   \e[1;4;31mInstalling Docker Compose:    \e[0m"
  sudo apt install -y docker-compose

  # Check if Docker Compose was installed and gets the current version.
  echo -e "   \e[1;4;31mDocker Compose has been installed in your system: \e[0m"
  docker-compose --version

  # Check if DDEV was installed by brew or not updating brew and previous versions of DDEV.
  if [[ $(which brew) ]]; then
    echo -e "   \e[1;4;31mThere was detected a version of Brew installed in your sistem. \e[0m"
    # Update the current version of the Brew Package Manager.
    brew update
    echo -e "   \e[1;4;31mUpgrading your current version of DDEV... \e[0m"
    # Upgrade the current version of DDEV.
    brew upgrade ddev
    echo -e "   \e[1;4;31mDDEV was upgraded in your system: \e[0m"
    ddev version
  else
    echo -e "   \e[1;4;31mThere wasn't detected a version of Brew installed in your sistem. \e[0m"
    # Download and executes the DDEV basic installation script.
    echo -e "   \e[1;4;31mProcessing the DDEV basic installation script...\e[0m"
    curl -L https://raw.githubusercontent.com/drud/ddev/master/scripts/install_ddev.sh | bash
    # Check if DDEV is available now in your system.
    echo -e "   \e[1;4;31mDDEV was installed in your system: \e[0m"
    ddev version
  fi
else
  echo "The execution of the script will be stopped. Bye!";
fi