gulp = require 'gulp'
del = require 'del'

gulp.task 'buildRequireConfig', ['cleanRequireConfig'], ->
  gulp.src('require.config.js')
  .pipe(gulp.dest('build/require'))

gulp.task 'cleanRequireConfig', -> del('build/require/*')
gulp.task 'watchRequireConfig', -> gulp.watch('require.config.js', ['buildRequireConfig'])

module.exports =
  build: 'buildRequireConfig'
  clean: 'cleanRequireConfig'
  watch: 'watchRequireConfig'
