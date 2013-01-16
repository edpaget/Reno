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

timestamp=`date -u +%Y-%m-%d_%H-%M-%S`

# Add timestamps
echo 'build timestamps...'
mv build/javascripts/app.js "build/javascripts/app-$timestamp.js"
mv build/javascripts/vendor.js "build/javascripts/vendor-$timestamp.js"
mv build/stylesheets/app.css "build/stylesheets/app-$timestamp.css"
mv build/stylesheets/vendor.css "build/stylesheets/vendor-$timestamp.css"

# Compress Assests
echo 'compress asses...'
gzip -9 -c "build/javascripts/app-$timestamp.js" > "build/javascripts/app-$timestamp.js.gz"
gzip -9 -c "build/javascripts/vendor-$timestamp.js" > "build/javascripts/vendor-$timestamp.js.gz"
gzip -9 -c "build/stylesheets/app-$timestamp.css" > "build/stylesheets/app-$timestamp.css.gz"
gzip -9 -c "build/stylesheets/vendor-$timestamp.css" > "build/stylesheets/vendor-$timestamp.css.gz"

# Substitue timestamped files
mv build/index.html build/index.old.html
sed "s/app\.\([a-z]*\)/app-$timestamp.\1/g;s/vendor\.\([a-z]*\)/vendor-$timestamp.\1/g" <build/index.old.html > build/index.html
rm build/index.old.html
echo 'build successful!'

