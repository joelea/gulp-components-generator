gulp = require 'gulp'
plumber = require 'gulp-plumber'

module.exports = (path) -> gulp.src(path).pipe(plumber())
