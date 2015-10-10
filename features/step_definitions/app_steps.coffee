connect = require 'connect'
http = require 'http'
path = require 'path'
portFinder = require 'portfinder'
serveStatic = require 'serve-static'


appSteps = ->

  @When /^my app is running$/, (done) ->
    app = connect()
    app.use serveStatic path.resolve(__dirname, '..', '..', 'dist')
    server = http.createServer app
    server.listen @port, =>
      @cleanup.push (next) -> server.close next
      done()


module.exports = appSteps
