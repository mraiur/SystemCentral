![Schema](SystemCentral.png)

Setup project for less problematic deployment.
The idea is to have two versions of the project and toggle them.

Got the idea from laravel's forge. But because the SystemCentral is only running scripts writen for your specific project is more flexible.

The beta version is updated and if you need to test before deployment.

When you run the ***publish*** command will switch the versions.

beta -> active

active -> beta

## Running the commands
```
./systemcentral.sh example.com setup

./systemcentral.sh example.com publish

./systemcentral.sh example.com update-beta

./systemcentral.sh example.com offline

./systemcentral.sh example.com online
```
Where 'example.com' is folder in projectConfigs

# Required for project setup
In projectConfigs create a folder for scripts required to deploy your project

```
example.com
  config.sh
  setup.sh
  publish.sh
  update-beta.sh
```

The config.sh script must contain these variables.
In this folder the setup.sh script must create two folders
1 and 2 that are used for active and beta versions.
```
DEPLOY_FOLDER="/ABSOLUTE PATH/"
```

The location used for symlinking the active version.
```
DEPLOY_PATH="/ABSOLUTE_ACTIVE_PATH"
```

The location used for symlinking the beta version.
```
DEPLOY_PATH_BETA="/ABSOLUTE_BETA_PATH"
```

# Commands

## setup
Runs the projectConfigs/PROJECT/setup.sh script that makes the setup of initial versions in folder 1 and folder 2;

## publish
Remove the current symlinks for active and beta versions and switch them.
The current version is stored in tje $DEPLOY_VOLDER/version file.

## update-beta
This script must updates the beta version of the project.

## offline
Unlinks the two version and executes offline.sh and links to offline folder.

## online
Unlinks offline folder and links the active to the version stored in "version" file.


# Known issues

## php-fpm fastcgi 
The problems is that fastcgi caches the file location.
To fix the problem on each vhost you must add these parameters.
This will make the fpm to read real path.

```
fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
fastcgi_param DOCUMENT_ROOT $realpath_root; 
```
