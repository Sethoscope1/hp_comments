'use strict';
 
var app = angular.module('app');
 
app.controller('UserCtrl', function($scope, $routeParams, User, Badge, $log, $modal) {
		$scope.currentUser = User.currentUser({ action: 'currentUser' });
		$scope.badges = User.badges({ action: 'badges' });
		$scope.allBadges = Badge.query();

		// $scope.open = function() {
		// 	
		// 		var badgeModalInstance = $modal.open({
		// 		templateUrl: 'modal.html',
		// 		controller: BadgeModalInstanceCtrl,
		// 		resolve: {
		// 			badges: function() {
		// 				return $scope.badges;
		// 			}
		// 		}
		// 	});
		// 	
		// 	badgeModalInstance.result.then(function(selectedItem) {
		// 		$scope.selected = selectedItem;
		// 	}, function() {
		// 		$log.info('Modal dismissed at: ' + new Date());
		// 	}
		// 	})
		// }
		
		// $scope.currentUser = function() {
		// 	// var users = User.query();
		// 	console.log(user)
		// 	var curr = user.$currentUser({ action: 'currentUser'})
		// 	// var curr =  User.$currentUser({action: 'currentUser'})
		// 	console.log(curr)
		// }
		// $scope.currentUser = User.$current({ action: "current"});

});


// app.controller('BadgeModalInstanceCtrl', function($scope, $badgeModalInstance, badges ) {
// 	
// 	$scope.badges = badges;
// 	$scope.selected = {
// 		badge: $scope.badge[0]
// 	};
// 	
// 	$scope.ok = function() {
// 		$badgeModalInstance.close($scope.selected.badge);
// 	};
// 	
// 	$scope.cancel = function() {
// 		$badgeModalInstance.dismiss('cancel');
// 	};
// 	
// 	
// });