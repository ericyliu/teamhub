NavController = ($location, $modal, $scope, AuthService) ->
  $scope.user = AuthService.user

  $scope.login = ->
    $modal
      .open
        templateUrl: 'views/modals/login.html'
        controller: 'AuthCtrl'

  $scope.logout = ->
    AuthService.logout()
    $location.path '/'

  $scope.signedIn = -> AuthService.signedIn()


NavController.$inject = ['$location', '$modal', '$scope', 'AuthService']


module.exports = NavController