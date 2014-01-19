set -e

echo "Running npm install..."
npm install

echo "Running bower install..."
node_modules/bower/bin/bower install

echo "Installing protractor/webdriver..."
./node_modules/protractor/bin/webdriver-manager update
