gulp = require 'gulp'
shell = require 'gulp-shell'
del = require 'del'
createPath = require('../utils/paths')
typescript = require 'typescript'
ts = require 'gulp-typescript'
browserSync = require '../browser-sync'

paths = createPath.from('ts').to('js')

compile = ts(module: 'amd')

gulp.task 'cleanTypescript', (done) -> del(paths.build, done)
gulp.task 'watchTypescript', -> gulp.watch(paths.src, ['test', 'buildTypescript'])
gulp.task 'buildTypescript', ->
  stream = paths.tap()
    .pipe(compile).js
    .pipe(paths.drain())

  stream.on 'end', browserSync.reload

  return stream

gulp.task 'test', ['buildTypescript'], ->
  paths.tapBuild()
    .pipe(shell('node_modules/intern/bin/intern-client.js config=intern-config/unit.js'))

module.exports =
  clean: 'cleanTypescript'
  build: 'buildTypescript'
  watch: 'watchTypescript'
  paths: paths
