'use strict';
 
var app = angular.module('app');
 
app.controller('UserCtrl', function($scope, $routeParams, User, Badge, UserBadge, $log, $modal) {
		$scope.currentUser = User.currentUser({ action: 'currentUser' });
		$scope.badges = UserBadge.query();
		$scope.allBadges = Badge.query();
});
