# Welcome to SummerHouse 

#### What is SummerHouse
Summer House is a sandbox for Drupal Decoupled projects. 
See the wiki section for more detailed info: [summerhouse/wiki](https://github.com/davidjguru/summerhouse/wiki) .  

#### Pre-requisites
You can only use SummerHouse in Linux environments and specifically in Debian / Ubuntu. SummerHouse requires the next resources:   
* [Git](https://git-scm.com/)  
* [Docker](https://www.docker.com/get-started/)  
* [Docker-Compose](https://docs.docker.com/compose/)  
* [DDEV](https://ddev.readthedocs.io/en/stable/)   

**If you don't have the prerequisites installed in your host system** you can install the resources from a installer script created and commited to the repository. The [installer script is here](https://raw.githubusercontent.com/davidjguru/summerhouse/main/scripts/installing_docker_dockercompose_ddev](https://raw.githubusercontent.com/davidjguru/summerhouse/main/scripts/installing_docker_dockercompose_ddev).

Just download the script in your system, give it permissions and execute the installer. This will install Docker, Docker-Compose and DDEV in your Linux system (Ubuntu, Debian). Also it will install some basic resources like git, jq, curl and basic packages.  

```bash
$ chmod +x installing_docker_dockercompose_ddev
$ ./installing_docker_dockercompose_ddev
``` 

#### Installation and deploy

```bash
$ git clone https://github.com/davidjguru/summerhouse.git
$ cd summerhouse
$ ddev start
```
And the project will be loaded, configured, enabled and deployed in your local environment. You will see the main URLs opening in your browser.

#### Addresses 

Summer House will deploy a series of containers in an internal network connected by DDEV, with internal or external addresses (or both), depending on the service they offer to the project.  
- Drupal backend: https://summerhouse.ddev.site (external) // ddev-summerhouse-web:443 (internal)
- Database: ddev-summerhouse-db:3306 (internal)
- PHPMyAdmin: https://summerhouse.ddev.site:8037 (external) // ddev-summerhouse-dba:80 (internal)
- Portainer: https://summerhouse.ddev.site:8001 (external) // ddev-summerhouse-portainer:9000 (internal)
- Mailhog: https://summerhouse.ddev.site:8026  (external)

#### Resources 

- Container web 1 - Drupal backend for editorial task.
- Container Database - Drupal database.
- PHPMyAdmin - Graphic Interface for the Drupal database.
- Portainer - Graphic Interface for managing Containers in a visual way.
- Mailhog - Email manager for testing. 

#### Useful Links 

* See the Issue Queue: [davidjguru/summerhouse/issues](https://github.com/davidjguru/summerhouse/issues)  
* See the Work In Progress: [davidjguru/summerhouse/project](https://github.com/davidjguru/summerhouse/projects/1)  
* See the related Milestones: [davidjguru/summerhouse/milestones](https://github.com/davidjguru/summerhouse/milestones)  
* See the Documentation pages: [davidjguru/summerhouse/wiki](https://github.com/davidjguru/summerhouse/wiki)  