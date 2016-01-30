
Step "1" "Create the first folder"
mkdir -p $DEPLOY_FOLDER"1"

Step "2" "Enter the first folder"
cd $DEPLOY_FOLDER"1"

Step "3" "Clone your project"
git clone REPOSITORY .

Step "4" "Copy some files like configuration"
cp $CONFIG_DIR"CONFIG_FILE" .

Step "5" "Some tweaking for the folders"
sudo chown -R mraiur:www-data uploads/

Step "6" "Go to main deploy folder"
cd $DEPLOY_FOLDER;

Step "7" "Copy the first copy of the project to a second copy"
cp -ar $DEPLOY_FOLDER"1" $DEPLOY_FOLDER"2"
