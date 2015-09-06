gulp = require 'gulp'
del = require 'del'

gulp.task 'buildBowerComponents', ['cleanBowerComponents'], ->
  gulp.src('bower_components/**/*')
  .pipe(gulp.dest('build/bower_components'))

gulp.task 'cleanBowerComponents', -> del('build/bower_components/*')
gulp.task 'watchBowerComponents', -> gulp.watch('bower_components/**/*', ['buildBowerComponents'])

module.exports =
  build: 'buildBowerComponents'
  clean: 'cleanBowerComponents'
  watch: 'watchBowerComponents'
