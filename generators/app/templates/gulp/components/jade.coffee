gulp = require 'gulp'
del = require 'del'
createPath = require('../utils/paths')
jade = require 'gulp-jade'
del = require 'del'
browserSync = require '../browser-sync'

paths = createPath.from('jade').to('html').with(buildRoot: 'build')
gulp.task 'cleanHtml', (done) -> del(paths.build, done)
gulp.task 'buildHtml', ->
  stream = paths.pourThrough(jade())
  stream.on 'end', browserSync.reload
  return stream

gulp.task 'watchHtml', -> gulp.watch(paths.src, ['buildHtml'])

module.exports =
  clean: 'cleanHtml'
  build: 'buildHtml'
  watch: 'watchHtml'
  paths: paths
