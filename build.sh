#! /bin/bash

# Setup Build Directorys and Brunch Build the Application
rm -rf build
cp -R public pre_build_public
cp -RL public build_public
rm -rf public
mv build_public public
echo 'building application...'
brunch build --minify
mv public build
mv pre_build_public public

time=`data -u +%Y-%m-%d_%H-%M-%S`
timestsamp="${time%\\n}"

# Add timestamps
mv build/javascripts/app.js "build/javascripts/app-$timestamp.js"
mv build/javascripts/vendor.js "build/javascripts/app-$timestamp.js"
mv build/stylesheets/app.css "build/javascripts/app-$timestamp.css"
mv build/stylesheets/vendor.css "build/stylesheets/vendor-$timestamp.css"

# Compress Assests
gzip -9 -c "build/javascripts/app-$timestamp.js" > "build/javascripts/app-$timestamp.js.gz"
gzip -9 -c "build/javascripts/vendor-$timestamp.js" > "build/javascripts/vendor-$timestamp.js.gz"
gzip -9 -c "build/stylesheets/app-$timestamp.css" > "build/stylesheets/app-$timestamp.css.gz"
gzip -9 -c "build/stylehseets/vendor-$timestamp.css" > "build/stylesheets/vendor-$timestamp.css.gz"

# Substitue timestamped files
mv index.html index.old.html
sed 's/app\.(css|js)/app-$timestamp.&;s/vendor\.(css|js)/vendor-$timestamp.&/' <index.old.html > index.html
rm index.old.html

