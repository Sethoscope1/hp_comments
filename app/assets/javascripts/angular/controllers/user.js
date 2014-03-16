'use strict';
 
var app = angular.module('app');
 
app.controller('UserCtrl', function($scope, $routeParams, User) {
    $scope.users = User.query();
		
		$scope.currentUser = User.currentUser({ action: 'currentUser' })
		$scope.badges = User.badges({ action: 'badges' })
		
		$scope.getBadges = function() {
			console.log("HERE")
			// console.log($scope.badges[0].description)
			// console.log($scope.badges[0]['description'])
		}
		// $scope.currentUser = function() {
		// 	// var users = User.query();
		// 	console.log(user)
		// 	var curr = user.$currentUser({ action: 'currentUser'})
		// 	// var curr =  User.$currentUser({action: 'currentUser'})
		// 	console.log(curr)
		// }
		// $scope.currentUser = User.$current({ action: "current"});
});