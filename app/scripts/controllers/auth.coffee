AuthController = ($location, $scope, AuthService) ->
  $scope.login = ->
    AuthService.login $scope.user
      .then ->
        $location.path '/main'
        $scope.$close()
      .catch (error) -> $scope.error = error.toString()

  $scope.register = ->
    AuthService.register $scope.user
      .then -> AuthService.login $scope.user
      .then ->
        $location.path '/onboarding'
        $scope.$close()
      .catch (error) -> $scope.error = error.toString()


AuthController.$inject = ['$location', '$scope', 'AuthService']


module.exports = AuthController