_setRoutes = ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'views/landing.html'
      controller: 'LandingCtrl'
    .when '/main',
      templateUrl: 'views/main.html'
    .when '/onboarding',
      templateUrl: 'views/onboarding.html'
      controller: 'OnboardingCtrl'
    .when '/profile',
      templateUrl: 'views/onboarding.html'
      controller: 'OnboardingCtrl'
    .otherwise
      redirectTo: '/'


configuration = ->
  [
    $routeProvider
  ] = arguments

  _setRoutes $routeProvider

configuration.$inject = [
  '$routeProvider'
]

module.exports = configuration
