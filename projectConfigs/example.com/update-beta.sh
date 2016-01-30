Step "1" "Go to current beta version"
cd $DEPLOY_PATH_BETA;

Step "2" "Fetch project changes"
git fetch;

Step "3" "Update the project"
git reset --hard origin/master;
