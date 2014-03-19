'use strict';
 
var app = angular.module('app');
 
app.controller('ModalCtrl', function($scope, User, $log, $modal, Badge) {
	$scope.badges = User.badges({ action: 'badges' });
	$scope.allBadges = Badge.query();

  $scope.open = function (event) {
    var modalInstance = $modal.open({
      templateUrl: 'modal.html',
      controller: ModalInstanceCtrl,
			badges: $scope.badges,
			backdrop: true,
			windowClass: "modal group",
      resolve: {
				event: function() {
					return event;
				}
      }
    });
  };
});

var ModalInstanceCtrl = function ($scope, $modalInstance, Badge, event) {
	$scope.allBadges = Badge.query();
	$scope.index = event.target.attributes["data-badgeid"].value || {};

	$scope.cancel = function() {
		$modalInstance.dismiss('cancel');
	};
};
