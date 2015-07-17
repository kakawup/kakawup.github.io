module.exports = (grunt) ->
  require("load-grunt-tasks")(grunt)

  myConfig =
    pkg:
      grunt.file.readJSON "package.json"
    dir:
      src:    "app"
      dist:   "dist"
      coffee: "coffee"
      sass:   "sass"
      js:     "js"
      css:    "css"
      lib:    "lib"
      img:    "img"

  # ===== Config ===== #
  grunt.initConfig
    # Package
    pkg: myConfig.pkg

    # Directory
    dir: myConfig.dir

    # Coffee Script
    coffee:
      options:
        bare: true
      compile:
        files: [
          expand: true
          cwd: "<%= dir.src %>/<%= dir.coffee %>/"
          src: ["**/*.coffee"]
          dest: "<%= dir.dist %>/<%= dir.js %>/"
          ext: ".js"
        ]

    # Compass
    compass:
      dist:
        options:
          config: "config.rb"

    # JS Hint
    jshint:
      files: ["<%= dir.dist %>/<%= dir.js %>/**/*.js"]

    # Copy Static Files
    copy:
      html:
        files: [
          expand: true
          cwd: "<%= dir.src %>/"
          src: ["**/*.html"]
          dest: "<%= dir.dist %>/"
        ]
      lib:
        files: [
          expand: true
          cwd: "<%= dir.src %>/<%= dir.lib %>/"
          src: ["**"]
          dest: "<%= dir.dist %>/<%= dir.lib %>/"
        ]
      img:
        files: [
          expand: true
          cwd: "<%= dir.src %>/<%= dir.img %>/"
          src: ["**/*.*"]
          dest: "<%= dir.dist %>/<%=dir.img %>/"
        ]

    # Livereload
    connect:
      livereload:
        options:
          port: 8000
          hostname: "localhost"
          base: "<%= dir.dist %>/"

    # Watch Files
    watch:
      options:
        livereload: true
      html:
        files: "<%= dir.src %>/**/*.html"
        tasks: ["copy:html"]
      lib:
        files: "<%= dir.src %>/<%= dir.lib %>/**/*"
        tasks: ["copy:lib"]
      css:
        files: "<%= dir.src %>/<%= dir.cass %>/**/*.scss"
        tasks: ["compass"]
      js:
        files: "<%= dir.src %>/<%= dir.coffee %>/**/*.coffee"
        tasks: ["coffee", "jshint"]
      img:
        files: "<%= dir.src %>/<%= dir.img %>/**/*.*"
        tasks: ["copy:img"]

    # Open Browser
    open:
      server:
        path: "http://localhost:<%= connect.livereload.options.port %>"

    # Clean Directory
    clean:
      dist: ["<%= dir.dist %>/*"]

    # Github Pages
    buildcontrol:
      options:
        dir: "<%= dir.dist %>/"
        commit: true
        push: true
        message: "Built %souceName% from commit %sourceCommit% on branch %source Branch%"
      pages:
        options:
          remote: "git@kakawup.github.com:kakawup/kakawup.github.io.git"
          branch: "master"


  # Plugin
  for npmTask in myConfig.pkg.devDependencies
    if npmTask.substring(0, 6) == "grunt-"
      grunt.loadNpmTasks(npmTask)

  # Tasks
  grunt.registerTask "default", ["open", "connect", "watch"]
  grunt.registerTask "build", ["coffee", "compass", "copy", "jshint"]
  grunt.registerTask "deploy", ["gh-pages"]
  grunt.registerTask "cleanup", ["clean"]
