async = require 'async'
{takeScreenshot} = require './screenshot_helpers'


hooks = ->

  @Before ->
    @cleanup = []


  @After (scenario, done) ->
    async.series [
      (next) =>
        if scenario.isFailed()
          takeScreenshot {@driver, scenario}, next
        else
          next()
      (next) =>
        async.parallel @cleanup, next
    ], done


module.exports = hooks
