echo "Running npm install..."
npm install

echo "Running bower install..."
bower install

echo "Installing protractor/webdriver..."
./node_modules/protractor/bin/webdriver-manager update
