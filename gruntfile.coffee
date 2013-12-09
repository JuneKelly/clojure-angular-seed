"use strict"

module.exports = (grunt) ->
  grunt.initConfig

    watch:
      coffee:
        files: [
          "resources/scripts/**/*.coffee"
        ]
        tasks: "newer:coffee"
        options:
          liveReload: true
      styles:
        files: ["resources/styles/*.sass"]
        tasks: "newer:compass"
      views:
        files: ["resources/views/*.html"]
        tasks: "newer:copy:views"
      fonts:
        files: ["resources/fonts/*"]
        tasks: "newer:copy:fonts"
      images:
        files: ["resources/images/*"]
        tasks: "newer:copy:images"

    exec:
      server:
        cmd: "lein with-profile dev ring server-headless"
      leintest:
        cmd: "lein with-profile testing test"

    coffee:
      compile:
        files:
          "resources/public/js/app.js": [
            "resources/scripts/*.coffee"
            "resources/scripts/controllers/*.coffee"
          ]

    copy:
      views:
        expand: true
        cwd: "resources/views"
        dest: "resources/public/views/"
        src: "*.html"
      bower:
        expand: true
        cwd: "resources/bower_components"
        dest: "resources/public/vendor/"
        src: "**/*"
      fonts:
        expand: true
        cwd: "resources/fonts"
        dest: "resources/public/fonts"
        src: "**/*"
      images:
        expand: true
        cwd: "resources/images"
        dest: "resources/public/img"
        src: "**/*"

    compass:
      dist:
        options:
          sassDir: "resources/styles"
          cssDir:  "resources/public/css"

    parallel:
      server:
        options:
          stream: true
        tasks: [{
          grunt: true
          args: 'exec:server'
        }, {
          grunt: true
          args: 'watch'
        }]

    protractor:
      manual:
        options:
          configFile: "./spec/config/protractor.conf.js"
          keepAlive: false


  grunt.loadNpmTasks "grunt-exec"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-newer"
  grunt.loadNpmTasks "grunt-parallel"
  grunt.loadNpmTasks "grunt-contrib-compass"
  grunt.loadNpmTasks "grunt-protractor-runner"

  grunt.registerTask "server", [
    "compass"
    "copy:views"
    "copy:bower"
    "copy:fonts"
    "copy:images"
    "coffee"
    "parallel:server"
  ]

  grunt.registerTask "test:all", [
    "test:e2e",
    "test:ring"
  ]

  grunt.registerTask "test:e2e", [
    "protractor:manual"
  ]

  grunt.registerTask "test:ring", [
    "exec:leintest"
  ]
