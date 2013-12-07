# clojure-angular-seed

A seed project for getting started fast with Clojure and AngularJS.


## Prerequisites

You will need [Leiningen][1] 2.0 or above installed.

[1]: https://github.com/technomancy/leiningen

You will also need to have [nodejs](http://nodejs.org) and
[ruby](http://ruby-lang.org) installed.


## Running

To set up the project, install grunt, coffeescript and bower:
```
$ npm install -g grunt-cli bower coffee-script
```
depending on how you installed nodejs, you may need root permissions for
the above command. Subsequent commands should not be run with root
permissions.


Install the Sass ruby gem:
```
$ gem install sass
```


Then install npm and bower packages:
```
$ npm install

$ bower install
```


Finally, to run the development server:
```
$ grunt server
```


To make the process of starting your new project easier, you can instantly
change the name of the project by running:
```
$ ./bin/change-project-name.sh <name>
```


For example: `$ ./bin/change-project-name.sh wibble` will change your
project and its clojure modules to be called 'wibble' rather than the
default 'cljang'.


## License

Copyright © 2013 Shane Kilkelly (MIT License)
