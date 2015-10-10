angular = require 'angular'
Firebase = require 'Firebase'

dependencies = [
  require 'angular-route'
  require 'angular-ui-bootstrap'
  require 'angularfire'
]

setServices = (module) ->
  module
    .factory 'AuthService', require './services/auth.coffee'

setControllers = (module) ->
  module
    .controller 'AuthCtrl', require './controllers/auth.coffee'
    .controller 'LandingCtrl', require './controllers/landing.coffee'
    .controller 'NavCtrl', require './controllers/nav.coffee'
    .controller 'OnboardingCtrl', require './controllers/onboarding.coffee'

setConstants = (module) ->
  module
    .constant 'FIREBASE_REF', new Firebase 'https://team-hub.firebaseio.com/'
    .constant '_', require 'lodash'
    .constant '$', require 'jquery'

dmgxModule = angular
  .module 'teamHubApp', dependencies
  .config require './config.coffee'

setConstants setControllers setServices dmgxModule
