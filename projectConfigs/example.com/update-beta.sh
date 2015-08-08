# Go to current beta version
cd $DEPLOY_PATH_BETA;

# Update the project
git fetch;
git reset --hard origin/master;
