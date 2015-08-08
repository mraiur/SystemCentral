#!/bin/bash
. ./helpers.sh

configurationFiles=$(find projectConfigs/ -type f -printf "%f\n");

if [ "$1" == "" ]; then
    logWhite "Select a configuration"
    echo $configurationFiles;
elif [ -d "./projectConfigs/"$1 ]; then
    commands=(setup publish update-beta);

    if [ "$2" == "" ]; then
        logGreen "Actions:"

        for cmd in ${commands[@]}
        do
            logWhite $cmd;
        done
    else
        hasHandler=false;
        source ./projectConfigs/$1/config.sh;
        CONFIG_DIR=$(pwd)"/projectConfigs/"$1"/"

        for cmd in ${commands[@]}
        do
            if [ "$2" == "$cmd" ]; then
              hasHandler=true;
              if [ "$cmd" == "publish" ]; then
                version=0
                if [ -f $DEPLOY_FOLDER"version" ]; then
                    version=$(cat $DEPLOY_FOLDER"version");
                fi

                if [ "$version" == "0" ]; then
                    ln -s $DEPLOY_FOLDER"2" $DEPLOY_PATH_BETA
                    ln -s $DEPLOY_FOLDER"1" $DEPLOY_PATH
                    echo "1" > $DEPLOY_FOLDER"version"
                else
                    if [ "$version" == "1" ]; then
                      activeVersion="2"
                      betaVersion="1"
                    else
                      activeVersion="1"
                      betaVersion="2"
                    fi
                    unlink $DEPLOY_PATH_BETA
                    unlink $DEPLOY_PATH

                    ln -s $DEPLOY_FOLDER$betaVersion $DEPLOY_PATH_BETA
                    ln -s $DEPLOY_FOLDER$activeVersion $DEPLOY_PATH
                    echo $activeVersion > $DEPLOY_FOLDER"version"
                fi
                logGreen "Execute project specific publish.sh script."
                source ./projectConfigs/$1/$2".sh";
              else
                source ./projectConfigs/$1/$2".sh";
              fi

            fi
        done
        if [ $hasHandler == false ]; then
            logRed "Invalid command: $2"
        fi
    fi
else
  logRed "Invalid configuration file provided."
fi
