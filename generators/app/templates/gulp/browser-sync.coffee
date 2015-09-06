gulp = require 'gulp'
browserSync = require('browser-sync').create()

gulp.task 'browserSync', ['cleanBuild'], ->
  browserSync.init(server: './build')

module.exports = browserSync
