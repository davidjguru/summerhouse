# Welcome to Summer House 
Welcome to Summer House, a fully-dockerized environment for onboarding processes based in Decoupled / Headless Drupal.  
![rota_casita_de_chocolate](https://user-images.githubusercontent.com/21089086/172926048-a4c5c787-4e2f-4904-8a34-d90f4c085a76.jpg)


### What is Summer House
Summer House is a sandbox for Drupal Decoupled projects, generating **[boilerplate code](https://www.freecodecamp.org/news/whats-boilerplate-and-why-do-we-use-it-let-s-check-out-the-coding-style-guide-ac2b6c814ee7/)**, built for **training** purposes and focused on **[learning-by-doing](https://www.lifehack.org/898427/learning-by-doing)**. The project is **self-contained** and host environment **agnostic**.
This project deploys a whole Decoupled Drupal platform on-the-fly with a lot of extra-resources, tools and configurations, but **only for local development**. You can use Summer House for **Onboarding processes**, workshops and training sessions. **Or just for fun**.  

* See the wiki section for more detailed info: [summerhouse/wiki](https://github.com/davidjguru/summerhouse/wiki).  

### Pre-requisites
You can use SummerHouse in Linux environments and specifically in Debian / Ubuntu. SummerHouse requires the next resources: [Git](https://git-scm.com/), [Docker](https://www.docker.com/get-started/), [Docker-Compose](https://docs.docker.com/compose/) and [DDEV](https://ddev.readthedocs.io/en/stable/).  

**If you don't have the prerequisites installed in your host system** you can install the resources from a installer script created and committed to the repository. The [installer script is here](https://raw.githubusercontent.com/davidjguru/summerhouse/main/scripts/installing_docker_dockercompose_ddev).

Just download the script in your system, give it permissions and execute the installer. This will install Docker, Docker-Compose and DDEV in your Linux system (Ubuntu, Debian). Also it will install some basic resources like git, jq, curl and basic packages.  

```bash
$ chmod +x installing_docker_dockercompose_ddev
$ ./installing_docker_dockercompose_ddev
``` 
**Note:** If you consider that delegate the prerequisites to a script is insecure or may put your environment at risk, here is some information so you can do it by yourself:
* [How to Install Docker](https://www.digitalocean.com/community/tutorial_collections/how-to-install-and-use-docker)  
* [How To Install Docker Compose](https://www.digitalocean.com/community/tutorial_collections/how-to-install-docker-compose)  
* [How to Install DDEV](https://www.digitalocean.com/community/tutorials/how-to-develop-a-drupal-9-website-on-your-local-machine-using-docker-and-ddev#option-2-mdash-installing-ddev-on-linux)  

### Installation and deploy

You can install Summer House in just three steps, just by doing:  

```bash
$ git clone https://github.com/davidjguru/summerhouse.git
$ cd summerhouse
$ ddev start
```
And the project will be loaded, configured, enabled and deployed in your local environment. You will see the main URLs opening in your browser.  
Please, **remember:** Summer House is **only** for local development. It can contain some configs that can be unsecure in other environments.  

### Addresses // Resources

Summer House will deploy a series of containers from an internal network connected by DDEV with external access from your browser: 

- **Drupal** Backend: http://backend.summerhouse.ddev.site
- **React** Frontend: http://react.summerhouse.ddev.site:3000
- **Database**: ddev-summerhouse-db:3306 (internal)
- **MkDocs**: Static Site generator for documents, in http://summerhouse.ddev.site:8091
- **PHPMyAdmin**: Graphic Interface for the database, in http://summerhouse.ddev.site:8036/
- **Portainer**: Graphic Interface for managing Containers, in http://summerhouse.ddev.site:9001
- **Mailhog**: Email testing tool, in http://summerhouse.ddev.site:8025/


### Useful Links 

* See the Issue Queue: [davidjguru/summerhouse/issues](https://github.com/davidjguru/summerhouse/issues)  
* See the Work In Progress: [davidjguru/summerhouse/project](https://github.com/davidjguru/summerhouse/projects/1)  
* See the related Milestones: [davidjguru/summerhouse/milestones](https://github.com/davidjguru/summerhouse/milestones)  
* See the Documentation pages: [davidjguru/summerhouse/wiki](https://github.com/davidjguru/summerhouse/wiki)  
