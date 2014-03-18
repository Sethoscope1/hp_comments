'use strict';
 
var app = angular.module('app');
 
app.controller('ModalCtrl', function($scope, User, $log, $modal, Badge) {
	$scope.badges = User.badges({ action: 'badges' });
	$scope.allBadges = Badge.query();
	
	console.log($scope.allBadges)
	
	var selected = $.grep($scope.allBadges, function(badge) {

	})


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
 		// console.log("JERERA")
    // modalInstance.result.then(function (selectedBadge) {	
    //   $scope.selected = selectedBadge;
    // }, function () {
    //   $log.info('Modal dismissed at: ' + new Date());
    // });
  };
});


var ModalInstanceCtrl = function ($scope, $modalInstance, Badge, event) {
	$scope.allBadges = Badge.query();
	$scope.index = event.target.attributes["data-badgeid"].value;

	
	// console.log(thisBadge);
	// $scope.cheese = "three"
	
	
	
	// console.log($scope.badgeInfo["data-badgeid"]);
	// $scope.badgeName = badgeInfo["data-badgename"];
	// var badgeDescription = badgeInfo["data-badgedescription"];
	// var badgeImage = badgeInfo["data-badgeimage"];
	
	// console.log(badgeName)
	// console.log(badgeDescription)
	// console.log(badgeImage)

	

	// $scope.badgeDescription = $scope.badgeInfo["data-badgedescription"];
	// $scope.badgeDescription = $scope.badgeInfo["data-badgedescription"];
	// $scope.badgeName = $scope.badgeInfo.data-badgename.value;
	// console.log($scope.badgeName);
	// $scope.badgeName = event.target.attributes.data-badgeName.value;
	// $scope.badgeDescription = event.target.attributes.data-badgeDescription.value;
	// $scope.badgeImage = event.target.attributes.data-badgeDescription.value;
	// 
	// console.log($scope.badgeName)
	// console.log($scope.badgeDescription)
	// console.log($scope.badgeImage)
	
	// var name = cracker.target.attributes.data-name.value;
// 	console.log(name)


	// $scope.badges = badges;

	// $scope.selected = {
	// 	badge: $scope.badges[0]
	// };
	
	// $scope.ok = function() {
	// 	$modalInstance.close($scope.selected.badge);
	// };
	
	$scope.cancel = function() {
		$modalInstance.dismiss('cancel');
	};
	
};
// app.controller('ModalInstanceCtrl', function($scope, $modalInstance, badges) {
// 	console.log("HERE")
// 	$scope.badges = badges;
// 	$scope.selected = {
// 		badge: $scope.badges[0]
// 	};
// 	
// 	$scope.ok = function() {
// 		$modalInstance.close($scope.selected.badge);
// 	};
// 	
// 	$scope.cancel = function() {
// 		console.log("CLICKING")
// 		$modalInstance.dismiss('cancel');
// 	};
// });