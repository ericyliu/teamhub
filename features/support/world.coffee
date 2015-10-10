firefox = require 'selenium-webdriver/firefox'
seleniumWebdriver = require 'selenium-webdriver'


class World

  port: 8081

  constructor: (done) ->
    done()


  clickElement: (locator) ->
    @getElement(locator).then (element) -> element.click()


  getDriver: ->
    unless @driver
      @driver = new firefox.Driver()
      @cleanup.push (next) => @driver.quit().then next, next
    @driver


  getElement: (locator) ->
    condition = seleniumWebdriver.until.elementLocated locator
    @driver.wait condition, 3000


  sendKeysToElement: (locator, text) ->
    @getElement(locator).then (element) -> element.sendKeys text


  switchToLatestWindow: ->
    @driver.getAllWindowHandles()
      .then (windows) =>
        @driver.switchTo().window windows[windows.length - 1]


module.exports = ->
  @World = World
