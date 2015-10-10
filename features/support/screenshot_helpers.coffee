fsExtra = require 'fs-extra'
path = require 'path'


outputDir = path.join __dirname, '..', 'screenshots'


takeScreenshot = ({driver, scenario}, done) ->
  filename = "#{path.basename scenario.getUri()}:#{scenario.getLine()}.png"

  logError = (err) ->
    # coffeelint: disable=no_debugger
    console.error err if err
    # coffeelint: enable=no_debugger
    done()

  saveScreenshot = (ss) ->
    fsExtra.outputFile path.join(outputDir, filename), ss, 'base64', logError

  driver.takeScreenshot().then saveScreenshot, logError


module.exports = {takeScreenshot}
