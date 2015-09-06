gulp = require 'gulp'
requireDir = require 'require-dir'
_ = require 'lodash'

components = _.values requireDir('./components')

module.exports =
  build: _.pluck components, 'build'
  clean: _.pluck components, 'clean'
  watch: _.pluck components, 'watch'
