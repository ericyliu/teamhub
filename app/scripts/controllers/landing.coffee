LandingController = ($modal, $scope) ->
  $scope.register = ->
    $modal
      .open
        templateUrl: 'views/modals/register.html'
        controller: 'AuthCtrl'

LandingController.$inject = ['$modal', '$scope']


module.exports = LandingController