# Summer House 

Summer House is sandbox for Drupal Decoupled projects.  
This was created to facilitate on-boarding processes in headless projects of complex architectures, as a starting material to test all the most important aspects of this type of installations. But remember: **It should only be used for training purposes in local development environments**.  

Through the installation and management of Summer House, you will be able to play and practice with a series of topics related to web development in general and Drupal in particular, performing tasks related to different parts of "Full Stack" development:  

1. Scripting: **Bash**, **commands** and **file management** are essential for SysAdmins / DevOps roles.  
2. Containerization: **Docker**, **Docker Compose**, **DDEV** are basic in the daily life of development.  
3. Backend Development: **PHP**, **Symfony**, **Drupal**, the holy Trinity in Drupal backend.  
4. Frontend Development: **React**, **Vue**, **JavaScript (Vanilla)**, the most used JavaScript resources for frontend.  
5. API Connections: **REST**, **GraphQL**, **Guzzle**, the two most popular models and the most popular PHP library for connections.  
6. Code Styling: **PHPCS**, **GrumPHP**, **Eslint**, the fundamental way of review your own code.   
7. Testing: **PHPUnit**, **Jest**, **Vitest**, learn how to develop code using Testing.  
 

One more time: **Please avoid deploying this project in production environments** or with output to the Internet.  

## 0. TL;DR

You can use SummerHouse in Linux environments, just by doing a local copy and then launch the platform using [DDEV, the containerization tool based in Docker](https://ddev.readthedocs.io/en/stable/). As **prerequisites**, You just need to have [Git](https://git-scm.com/) and DDEV ([Docker](https://www.docker.com/get-started/), [Docker-Compose](https://docs.docker.com/compose/)) installed on your system. 


```bash
$ git clone https://github.com/davidjguru/summerhouse.git
$ cd summerhouse
$ ddev start
```
And the project will be loaded, configured, enabled and deployed in your local environment. You will see the main URLs opening in your browser.

If you don't have the prerequisites installed in your host system, or maybe you are testing from a clean virtual machine, you can install the resource from a installer script created and commited to the repository. The installer script is here: 
[](https://raw.githubusercontent.com/davidjguru/summerhouse/main/scripts/installing_docker_dockercompose_ddev)

just download or copy/paste the content of the script in a file in your system, giving permissions and execute the installer script. This will install Docker, Docker-Compose and DDEV in your Linux system (Ubuntu, Debian). Also it will install some basic resources like git, jq, curl and basic packages.  

```bash
$ chmod +x installing_docker_dockercompose_ddev
$ ./installing_docker_dockercompose_ddev
```

This resource is available inside the folder `/scripts` in the root folder of the project.  

--------------------------------------------
**Table of Contents**
- [Summer House](#summer-house)  
  - [0. TL;DR](#0-tldr)  
  - [1. Introduction](#1-introduction)  
  - [2. Tooling / Stack](#2-tooling--stack)  
  - [3. How to deploy the platform](#3-how-to-deploy-the-platform)  
  - [4. Architecture](#4-architecture)  
  - [5. Read More](#5-read-more-1)  
-----------------------------------------------


## 1. Introduction  


## 2. Tooling / Stack  


**1. Control Version**  

1. Git
2. Github
3. Gitflow 

**2. Containerization (Software virtualization)**  

1. Docker
2. Docker Compose
3. DDEV
   
**3. Web technologies**  

1. Drupal / PHP
2. ReactJS
3. GraphQL
   
**4. Code Styling**  

5. PHPCS
6. PHPBF
7. GrumPHP
## 3. How to deploy the platform   


## 4. Architecture  



## 5. Read More  


### About DDEV 
* [Books/ Local Web development with DDEV.](https://www.therussianlullaby.com/blog/books-local-web-development-with-ddev-explained/)  
* [Docker, Docker-Compose and DDEV - Cheatsheet.](https://www.therussianlullaby.com/blog/docker-docker-compose-and-ddev-cheatsheet/)  
* [Creating development environments for Drupal with DDEV](https://www.therussianlullaby.com/blog/creating-development-environments-for-drupal-with-ddev/)  