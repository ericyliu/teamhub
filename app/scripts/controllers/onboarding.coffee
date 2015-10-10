OnboardingController = ($location, $scope, AuthService) ->
  $scope.user = AuthService.user

  $scope.confirm = ->
    AuthService.createProfile $scope.user.profile
      .then (profile) ->
        AuthService.profile = profile
        $location.path '/main'


OnboardingController.$inject = ['$location', '$scope', 'AuthService']


module.exports = OnboardingController