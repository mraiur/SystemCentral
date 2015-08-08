# Create the first folder
mkdir -p $DEPLOY_FOLDER"1"

# Enter the first folder and clone your project
cd $DEPLOY_FOLDER"1"
git clone REPOSITORY .

# Copy some files like configuration
cp $CONFIG_DIR"CONFIG_FILE" .

# Some tweaking for the folders
sudo chown -R mraiur:www-data uploads/

# Go to main deploy folder
cd $DEPLOY_FOLDER;

# Copy the first copy of the project to a second copy
cp -ar $DEPLOY_FOLDER"1" $DEPLOY_FOLDER"2"
