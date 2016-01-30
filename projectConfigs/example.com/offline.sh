Step "1" "Make offline folder"
mkdir -p $DEPLOY_FOLDER"offline"

Step "2" "Do a action to make the application offline"
echo "offline" > $DEPLOY_FOLDER"offline/index.html"
