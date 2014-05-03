path = require 'path'
through = require 'browserify-through'

wrap = (callback) ->
  (err, src) ->
    src = "module.exports = #{JSON.stringify src}" if src?
    callback err, src

compilers =
  '.coffee': (src, filepath, debug, callback) ->
    require('coffee-compiler').fromSource src, {sourceMap: debug, filename: filepath, bare: yes}, callback

  '.less': (src, filepath, debug, callback) ->
    require('less-compiler').fromSource src, {sourceMap: false, filename: filepath}, wrap callback

  '.jade': (src, filepath, debug, callback) ->
    require('jade-compiler').fromSource src, {}, wrap callback

getCompiler = (filepath) ->
  compiler = compilers[path.extname filepath]

module.exports = through
  filter: (filepath) ->
    getCompiler filepath

  map: (filepath, data, callback) ->
    getCompiler(filepath) data, filepath, debug: true, callback
