gulp = require 'gulp'
del = require 'del'
createPath = require('../utils/paths')
sass = require 'gulp-sass'
browserSync = require '../browser-sync'

paths = createPath.from('sass').to('css')
buildPath = './build/styles'
srcPath = './src/styles/**/*'

gulp.task 'cleanStyles', (done) -> del(paths.build, done)
gulp.task 'buildStyles', ->
  paths.pourThrough(sass())
    .pipe(browserSync.stream())
gulp.task 'watchStyles', -> gulp.watch(paths.src, ['buildStyles'])

module.exports =
  clean: 'cleanStyles'
  build: 'buildStyles'
  watch: 'watchStyles'
  paths: paths
