path = require 'path'
through = require 'through'

compilers =
  '.js': (src, filepath, debug, callback) ->
    callback null, src

  '.coffee': (src, filepath, debug, callback) ->
    require('coffee-compiler').fromSource src, {sourceMap: debug, filename: filepath, bare: yes}, callback

  '.less': (src, filepath, debug, callback) ->
    require('less-compiler').fromSource src, {sourceMap: false, filename: filepath}, (err, src) ->
      src = "module.exports = #{JSON.stringify src}" if src?
      callback err, src

  '.jade': (src, filepath, debug, callback) ->
    require('jade-compiler').fromSource src, {}, (err, src) ->
      src = "module.exports = #{JSON.stringify src}" if src?
      callback err, src

module.exports = (filepath) ->
  data     = ''
  ext      = path.extname filepath
  compiler = compilers[ext]

  write = (chunk) ->
    data += chunk

  end = ->
    compiler data, filepath, debug: true, (err, code) =>
      if err?
        @emit 'error', err
      else
        @queue code
        @queue null

  if compiler
    through write, end
  else
    through()
