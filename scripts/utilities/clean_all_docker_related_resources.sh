#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
#
#-----------------------------------------------------------------------------------------
# 
# Stop, clean and delete all the Docker-related resources in your sistem.
# [David Rodríguez, @davidjguru] [david.rodriguez@digitalistgroup.com]
# Title: clean_all_docker_related_resources
# Description: Stop and delete all Docker resources: images, containers, volumes, networks. 
#
# davidjguru@gmail.com
# https://www.therussianlullaby.com
# https://davidjguru.github.io/
# https://dev.to/davidjguru
# https://github.com/davidjguru
#-----------------------------------------------------------------------------------------
#

# Ask for confirmation.
echo -e "   \e[1;4;31mThis script will execute a complete pruning of your Docker resources (images, containers, volumes...) in your system. \e[0m"
echo -e "   \e[1;4;31mThese changes can be dangerous. Please, consider another isolation layer, like VirtualBox. \e[0m"
read -p "Are you sure? [Y/y]" -n 1 -r
echo    # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  # Initially get a summary about the initial status for all the Docker resources.
  echo -e "   \e[1;4;31mInitial summary of your current Docker system and resources: \e[0m"
  docker system df

  # Kill (stop) all containers running selected by ID.
  echo -e "   \e[1;4;31mStopping all the running containers. \e[0m"
  docker kill $(docker ps -q)

  # Remove all containers with status=exited (stopped).
  echo -e "   \e[1;4;31mRemoving all the stopped containers. \e[0m"
  docker rm $(docker ps -q -f status=exited)

  # Delete images by ID.
  echo -e "   \e[1;4;31mDeleting Docker images by its ID. \e[0m"
  docker rmi $(docker image ls -q) 

  # Remove unused images.
  echo -e "   \e[1;4;31mRemoving all unused Docker images. \e[0m"
  yes |docker image prune

  # Remove all volumes.
  echo -e "   \e[1;4;31mRemoving all Docker volumes. \e[0m"
  docker volume prune -f

  # Remove all existing networks.
  echo -e "   \e[1;4;31mRemoving all existing Docker networks. \e[0m"
  docker network prune -f

  # Remove ALL: stopped containers, all networks.
  echo -e "   \e[1;4;31mExecuting a full cleaning of Docker resources. \e[0m"
  yes |docker system prune -a

  # Finally get a full summary about the current Docker resources.
  echo -e "   \e[1;4;31mFinal summary of your current Docker system and resources: \e[0m"
  docker system df
else
  echo "The execution of the script will be stopped. Bye!";
fi
