module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffee:
      compile:
        options:
          bare: true
        files: [
          src  : 'src/mbta.coffee'
          dest : 'public/dist/mbta.js'
        ,
          src  : 'src/lib/parsers.coffee'
          dest : 'public/dist/lib/parsers.js'
        ]
    watch:
      scripts:
        files: '**/*.coffee'
        tasks: ['default']
    cafemocha:
      test:
        src: 'test/*.js'
        options:
          ui: 'tdd'
          growl: true
          require: ['should']
          reporter: 'nyan'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-cafe-mocha'

  grunt.registerTask 'default', ['coffee', 'cafemocha']
