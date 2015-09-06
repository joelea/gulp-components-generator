gulp = require 'gulp'
runSequence = require('run-sequence')
componentTasks = require './all-components'

gulp.task 'build', componentTasks.build
gulp.task 'clean', componentTasks.clean
gulp.task 'watch', componentTasks.watch
gulp.task 'cleanBuild', (done) -> runSequence('clean', 'build', done)

gulp.task 'dev', ['test', 'watch', 'browserSync']
gulp.task 'serve', ['dev', 'browserSync']
gulp.task 'default', ['serve']
