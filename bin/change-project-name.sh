#!/usr/bin/env bash

NEWNAME=$1

echo Changing project name to $NEWNAME

grep -rl cljang ./src | xargs sed -i s/cljang/$NEWNAME/g
grep -rl cljang ./test | xargs sed -i s/cljang/$NEWNAME/g
grep -rl cljang ./resources | xargs sed -i s/cljang/$NEWNAME/g

grep -rl cljang ./project.clj | xargs sed -i s/cljang/$NEWNAME/g
grep -rl clojure-angular-seed ./bower.json | xargs sed -i s/clojure-angular-seed/$NEWNAME/g
grep -rl clojure-angular-seed ./package.json | xargs sed -i s/clojure-angular-seed/$NEWNAME/g



mv ./src/cljang ./src/$NEWNAME
mv ./test/cljang ./test/$NEWNAME
