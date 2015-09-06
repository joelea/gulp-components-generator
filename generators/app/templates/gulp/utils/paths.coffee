gulp = require 'gulp'
tap = require './tap'

paths = from: (srcType) -> to: (destType) -> new Paths(srcType, destType)

class Paths
  constructor: (@srcType, @destType, options) ->
    @src = "src/#{@srcType}/**/*"
    @build = options?.buildRoot ? "build/#{@destType}/"

  with: (options) -> new Paths(@srcType, @destType, options)

  tap: -> tap(@src)
  tapBuild: -> tap(@build)
  drain: => gulp.dest(@build)

  pourThrough: (transform) ->
    @tap()
      .pipe(transform)
      .pipe(@drain())

module.exports = paths