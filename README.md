![summerhouse_main_image](https://user-images.githubusercontent.com/21089086/173317358-c6698da5-0169-4df4-adf0-2273373feb4f.png)

# Welcome to Summer House 
Welcome to Summer House, a fully-dockerized environment for onboarding processes based in Decoupled / Headless Drupal.  

--------------------------------
* [1. What is Summer House](#1-what-is-summer-house)  
* [2. Pre-requisites](#2-pre-requisites)  
* [3. Install // Uninstall](#3-install--uninstall)  
* [4. Addresses // Resources](#4-addresses--resources)  
* [5. Troubleshooting](#5-troubleshooting)  
* [6. Useful Links](#6-useful-links)  
* [7. Other Projects with similar natura](#7-other-projects-with-similar-natura)  
* [8. Acknowledgments and Thanks](#8-acknowledgments-and-thanks)  
---------------------------------
### 1. What is Summer House
Summer House is a sandbox for Drupal Decoupled projects, generating **[boilerplate code](https://www.freecodecamp.org/news/whats-boilerplate-and-why-do-we-use-it-let-s-check-out-the-coding-style-guide-ac2b6c814ee7/)**, built for **training** purposes and focused on **[learning-by-doing](https://www.lifehack.org/898427/learning-by-doing)**. The project is **self-contained** and host environment **agnostic**.
This project deploys a whole Decoupled Drupal platform on-the-fly with a lot of extra-resources, tools and configurations, but **only for local development**. You can use Summer House for **Onboarding processes**, workshops and training sessions. **Or just for fun**.  

* See the wiki section for more detailed info: [summerhouse/wiki](https://github.com/davidjguru/summerhouse/wiki).  

### 2. Pre-requisites
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

### 3. Install // Uninstall
#### Installating and deploy  
You can install Summer House in just three steps, just by doing:  

```bash
$ git clone https://github.com/davidjguru/summerhouse.git #Get a local copy.
$ cd summerhouse #Move to the folder.
summerhouse$ ddev start #Run the DDEV build up.
```
And the project will be loaded, configured, enabled and deployed in your local environment. You will see the main URLs opening in your browser.  
Please, **remember:** Summer House is **only** for local development. It can contain some configs that can be unsecure in other environments.  

You can also download the project from [the releases / tags area of the Github repository](https://github.com/davidjguru/summerhouse/releases), selecting the version and downloading the compressed folder. Then you only have to unpack the project and launch DDEV:  

```bash 
$ wget https://github.com/davidjguru/summerhouse/archive/refs/tags/v1.0.0.zip
$ unzip summerhouse-1.0.0.zip
$ cd summerhouse-1.0.0/
summerhouse-1.0.0$ ddev start
```
And the platform will be mounted and deployed.  

#### Uninstalling and clean up

In order to execute a complete cleaning of your Summer House installation you can do the next steps.  

```bash
$ cd summerhouse
summerhouse$ yes| ddev delete -O #Delete the DDEV register for Summer House.
summerhouse$ ./scripts/utilities/clean_all_docker_related_resources.sh #Will destroy all docker resources.
summerhouse$ cd ..
$ sudo rm -rf summerhouse #Delete all the codebase. 
```


### 4. Addresses // Resources

Summer House will deploy a series of containers from an internal network connected by DDEV with external access from your browser: 

- **Drupal** Backend: http://backend.summerhouse.ddev.site
- **React** Frontend: http://react.summerhouse.ddev.site:3000
- **Database**: ddev-summerhouse-db:3306 (internal)
- **MkDocs**: Static Site generator for documents, in http://summerhouse.ddev.site:8091
- **PHPMyAdmin**: Graphic Interface for the database, in http://summerhouse.ddev.site:8036/
- **Portainer**: Graphic Interface for managing Containers, in http://summerhouse.ddev.site:9001
- **Mailhog**: Email testing tool, in http://summerhouse.ddev.site:8025/

### 5. Troubleshooting
Some common problems have been identified. Check this section for quick interventions.  
For more extended information on known bugs and their solutions, [visit the related wiki section](https://github.com/davidjguru/summerhouse/wiki/Troubleshooting).  

#### Some ports unavailable
Problems have been detected due to port blocking by other applications. This can cause DDEV start-up problems and lead to others problems during the installation process of the main website, you can get errors just like:  
```
[error]  Drupal\Core\Config\ConfigImporterException: There were errors validating the config synchronization.
Entities exist of type <em class="placeholder">Shortcut link</em> and <em class="placeholder">Shortcut set</em> <em class="placeholder">Default</em>. These entities need to be deleted before importing. in Drupal\Core\Config\ConfigImporter->validate() (line 750 of /var/www/html/backend_drupal/core/lib/Drupal/Core/Config/ConfigImporter.php).
```

DDEV operates with ports used by other resources, such as 80 or 443. Check that they are not in use (you do not have Apache running on your system).  

#### Error messages accessing external resources
Summer House obtains a lot of resources through the Internet, so sometimes you can get errors when trying to get external resources:  

```
A MkDocs service file has been located in your system.
fatal: unable to access 'https://github.com/davidjguru/summerhouse.wiki.git/': Could not resolve host: github.com
Task failed: Exec command '([ -d ./mkdocs/docs ] && cd ./mkdocs/docs && git pull origin) || (git clone https://github.com/davidjguru/summerhouse.wiki.git ./mkdocs/docs)'
```
(We're building up the mkdocs container from a git clone of the repository wiki).

This is the key: `Could not resolve host: github.com`. You need to check in these cases your assigned DNS servers (or those of your ISP), to ensure that they are functioning normally. 

#### Some errors from commands in macOS 

When you're installing Summer House in macOS, some people have reported errors in prompt from some commands execution. Specifically, errors derived from some commands used in the installation process not available in macOS, for instance: 

```
bash: xdg-open: command not found
```
The equivalent command in macOS would be just `open`, so you can try to change this command in `.ddev/config.yaml', lines [34](https://github.com/davidjguru/summerhouse/blob/9cc927ee0cacd03ec174c4cfbfe8756544014808/.ddev/config.yaml#L34) to [38](https://github.com/davidjguru/summerhouse/blob/9cc927ee0cacd03ec174c4cfbfe8756544014808/.ddev/config.yaml#L38).  

And: 
```
Task failed: Exec command 'sed -i '12s/restart: "no"/restart: "on-failure"/' ./.ddev/docker-compose.portainer.yaml' on the host: exit status 1
```
...When we're altering the restarting policies for the Portainer Container by using the `sed` command.  


**Remember**, more information on how to deal with more specific errors can be found here:  
[summerhouse/wiki/troubleshooting](https://github.com/davidjguru/summerhouse/wiki/Troubleshooting).  


### 6. Useful Links 

* See the Issue Queue: [summerhouse/issues](https://github.com/davidjguru/summerhouse/issues)  
* See the Work In Progress: [summerhouse/project](https://github.com/davidjguru/summerhouse/projects/1)  
* See the related Milestones: [summerhouse/milestones](https://github.com/davidjguru/summerhouse/milestones)  
* See the Documentation pages: [summerhouse/wiki](https://github.com/davidjguru/summerhouse/wiki)  

### 7. Other projects with similar natura  

Summer House may not be exactly what you're looking for, but it comes close. If you want to check out other projects that might be closer to your needs, you can try the cases in the following list:  

* [Decoupled Drupal 8 with GatsbyJS Frontend built over Docksal](https://github.com/docksal/boilerplate-drupal-gatsby)  
* [Metadrop's Drupal Boilerplate built over Docker4Drupal](https://github.com/Metadrop/drupal-boilerplate)  
* [Systemseed's Drupal ReactJS Boilerplate, built over Docker4Drupal](https://github.com/systemseed/drupal_reactjs_boilerplate)  
  
  
### 8. Acknowledgments and Thanks

* Thanks to [Digitalist Sweden](https://www.digitalist.se/english) for the opportunity to improve the onboarding processes.  
* Thanks to [Helena Nordenfelt](https://www.linkedin.com/in/helena-nordenfelt-4472184/) for giving me the chance to focusing on this idea.  
* Thanks to [Randy Fay](https://www.linkedin.com/in/randyfay/) for the amazing work in [DDEV](https://ddev.readthedocs.io/en/stable/) and [its community](https://github.com/drud/ddev-contrib).   
* Thanks to [Pedro Cambra](https://www.linkedin.com/in/pcambra/) from [Cambrico](https://www.drupal.org/cambrico), for being a true mentor.   
  
