require 'coffee-errors'

chai = require 'chai'
browserify = require 'browserify'
# using compiled JavaScript file here to be sure module works
browserifySmith = require '../lib/browserify-smith.js'

expect = chai.expect

describe 'browserify-smith', ->
  results = null

  before (done) ->
    b = browserify extensions: '.coffee'
    b.transform browserifySmith
    b.add "#{__dirname}/fixtures/index.js"

    b.bundle (err, r) ->
      results = r
      done err

  it 'includes coffee', -> expect(results).to.match /hello coffee/
  it 'includes jade', -> expect(results).to.match /hello jade/
  it 'includes less', -> expect(results).to.match /hello less/
