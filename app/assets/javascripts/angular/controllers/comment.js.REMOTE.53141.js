// 'use strict';
//  
// var app = angular.module('app');
// 
// angular.module('app').filter('fromNow', function() {
//   return function(date) {
//     return moment(date).fromNow();
//   }
// });
// 
// app.controller('CommentCtrl', function($scope, Comment, User, CommentFavorite, Badge, $routeParams, $location, $modal) {
//     $scope.comments = Comment.query({articleId: $routeParams.id});		
// 		$scope.currentUser = User.currentUser({ action: 'currentUser' });
// 		$scope.badges = User.badges({ action: 'badges' });
// 		
// 		var refreshBadges = function() {
// 			return User.badges({ action: 'badges'});
// 		}
// 
//     $scope.save = function() {
//         var obj = new Comment({ body: $scope.body, articleId: $routeParams.id});
//  
//         obj.$save(function(response) {
// 	        $scope.comments.unshift(response);
// 	        $scope.name = $scope.body = "";
//         }, function(response) {
//           $scope.errors = response.data.errors;
//         });
//     };
// 		
// 		var userIndex = User.query();
// 		
// 		$scope.getUserName = function(user_id) {
// 
// 			var user = $.grep(userIndex, function(user){
// 				return user.id == user_id;
// 			})[0];
// 			if(user == undefined) {
// 				return null;
// 			}
// 			return user.username;
// 		};
// 		
// 		$scope.upvote = function(comment, $event) {
// 			comment.$upvote({articleId: $routeParams.id, commentId: comment.id, action: 'upvote'}, function(response) {
// 			})
// 			checkBadges();
// 		};
// 		
// 		$scope.downvote = function(comment, $event) {
// 			comment.$downvote({articleId: $routeParams.id, commentId: comment.id, action: 'downvote'}, function(response) {	
// 			})
// 			checkBadges();
// 		};
// 		
// 		// var updateAchievements = function(badge) {
// 	// 		var $achievements = $("#achievementContainer");
// 	// 		($achievements).prepend("FOODS");
// 	// 	};
// 		
// 		var checkBadges = function(){
// 			console.log('up or down')
// 			var oldBadges = $scope.badges;
// 			var updatedBadges = User.badges({ action: "badges"});
// 			updatedBadges.$promise.then(function(data) {
// 				var oldIds = {}
// 				_.each(oldBadges, function(oldBadge){
// 					oldIds[oldBadge["badge"]["id"]] = oldBadge;
// 				});
// 				
// 				var newBadges = data.filter(function(badge){
// 					return !(badge["badge"]["id"] in oldIds)
// 				});	
// 				
// 				_(newBadges).each(function(badge, index) {			
// 				  setTimeout(function(){
// 						$scope.popup(badge["badge"]);
// 						updateAchievements(badge);
// 				  }, index * 5000);    
// 				});
// 				
// 				$scope.badges = data;
// 			});
// 		};
// 	
// 		$scope.popup = function(badge) {
// 			console.log("BADGEY")		
// 			console.log(badge)
// 	    var modalInstance = $modal.open({
// 	      templateUrl: 'modalpopup.html',
// 	      controller: ModalPopupInstanceCtrl,
// 				badge: badge,
// 				backdrop: true,
// 				windowClass: "modal group",
// 	      resolve: {
// 					badge: function() {
// 						return badge;
// 					}
// 	      }
// 	    });	
// 		};
// });
// 
// var ModalPopupInstanceCtrl = function ($scope, $modalInstance, Badge, badge) {
// 	// $scope.allBadges = Badge.query();
// 	// $scope.index = event.target.attributes["data-badgeid"].value || {};
// 	
// 	// $scope.badge = badge;
// 	// console.log(badge)
// 	
// 	$scope.badge = badge
// 
// 	$scope.cancel = function() {
// 		$modalInstance.dismiss('cancel');
// 	};
// 	
// };
// 
// 
