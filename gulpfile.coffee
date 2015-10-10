autoprefixer = require 'autoprefixer-stylus'
browserify = require 'browserify'
coffeeify = require 'coffeeify'
colors = require 'colors/safe'
concat = require 'gulp-concat'
connect = require 'gulp-connect'
gulp = require 'gulp'
jade = require 'gulp-jade'
rimraf = require 'gulp-rimraf'
source = require 'vinyl-source-stream'
stylus = require 'gulp-stylus'


catchErrors = (compiler) ->
  compiler.on 'error', (err) ->
    console.error colors.red(err.message)
    @emit 'end'


src = 'app'
dest = 'dist'


gulp.task 'build', ['compile:jade', 'compile:js', 'compile:stylus', 'copy:assets', 'copy:vendor']


gulp.task 'clean', ->
  gulp.src './dist', read: false
    .pipe rimraf()


gulp.task 'compile:jade', ->
  gulp.src ['index.jade', 'views/**/*.jade'], base: src, cwd: src
    .pipe catchErrors jade()
    .pipe gulp.dest 'dist'
    .pipe connect.reload()


gulp.task 'compile:js', ->
  compiler = browserify 'scripts/app.coffee', basedir: src, debug: true
    .transform coffeeify
    .bundle()

  catchErrors compiler
    .pipe source 'app.js'
    .pipe gulp.dest 'dist'
    .pipe connect.reload()


gulp.task 'compile:stylus', ->
  gulp.src 'styles/**/*', cwd: src
    .pipe catchErrors stylus(use: [autoprefixer()])
    .pipe concat 'app.css'
    .pipe gulp.dest 'dist'
    .pipe connect.reload()


gulp.task 'copy:assets', ->
  gulp
    .src 'assets/**/*', base: src, cwd: src
    .pipe gulp.dest 'dist'
    .pipe connect.reload()


gulp.task 'copy:vendor', ->
  gulp
    .src 'vendor/**/*', base: src, cwd: src
    .pipe gulp.dest 'dist'
    .pipe connect.reload()


gulp.task 'serve', ['build'], ->
  connect.server livereload: yes, port: 8080, root: 'dist'


gulp.task 'watch', ->
  gulp.start 'serve'
  gulp.watch 'app/assets/**/*', ['copy:assets']
  gulp.watch 'app/**/*.jade', ['compile:jade']
  gulp.watch 'app/**/*.coffee', ['compile:js']
  gulp.watch 'app/**/*.styl', ['compile:stylus']
  gulp.watch 'app/vendor/**/*', ['copy:vendor']


gulp.task 'default', ['watch']
