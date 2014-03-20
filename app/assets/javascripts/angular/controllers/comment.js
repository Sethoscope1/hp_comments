'use strict';
 
var app = angular.module('app');

angular.module('app').filter('fromNow', function() {
  return function(date) {
    return moment(date).fromNow();
  }
});

app.controller('CommentCtrl', function($scope, Comment, User, CommentFavorite, Badge, UserBadge, $routeParams, $location, $modal) {
    $scope.comments = Comment.query({articleId: $routeParams.id});		
  		$scope.currentUser = User.currentUser({ action: 'currentUser' });
  		$scope.badges = UserBadge.query();
  // 		
		var refreshBadges = function() {
			return UserBadge.query();
		}

    $scope.save = function() {
      var obj = new Comment({ body: $scope.body, articleId: $routeParams.id});
 
        obj.$save(function(response) {
	        $scope.comments.unshift(response);
	        $scope.name = $scope.body = "";
					checkBadges();
        }, function(response) {
          $scope.errors = response.data.errors;
        });
    };
		
		var userIndex = User.query();
		
		$scope.getUserName = function(user_id) {
			
			var user = $.grep(userIndex, function(user){
				return user.id == user_id;
			})[0];
			if(user == undefined) {
				return null;
			}
			return user.username;
		};
		
		$scope.upvote = function(comment, $event) {
			comment.$upvote({articleId: $routeParams.id, commentId: comment.id, action: 'upvote'}, function(response) {
			})
			checkBadges();
		};
		
		$scope.downvote = function(comment, $event) {
			comment.$downvote({articleId: $routeParams.id, commentId: comment.id, action: 'downvote'}, function(response) {	
			})
			checkBadges();
		};
		
		var checkBadges = function(){
			var oldBadges = $scope.badges;
			var updatedBadges = UserBadge.query();
			updatedBadges.$promise.then(function(data) {
				var oldIds = {};
				_.each(oldBadges, function(oldBadge){
					oldIds[oldBadge["badge"]["id"]] = oldBadge;
				});
				
				var newBadges = data.filter(function(badge){
					return !(badge["badge"]["id"] in oldIds);
				});	
				
				_.each(newBadges, function(badge) {
					popup(badge["badge"]);
					updateAchievements(badge["badge"])
				});
				
				$scope.badges = data;
			});
		};
	
		var popup = function(badge) {
	    var modalInstance = $modal.open({
	      templateUrl: 'modalpopup.html',
	      controller: ModalPopupInstanceCtrl,
				badge: badge,
				backdrop: 'true',
				windowClass: "modal group",
	      resolve: {
					badge: function() {
						return badge;
					}
	      }
	    });	
		};
		
		var updateAchievements = function(badge) {
			var $achievements = $("#achievementContainer");
			console.log($achievements);
			
			var $achievement = $("<div>").append($("<li>").append($("<i>", {class: "fa fa-star"}), $("<span>", {class: "badge-name"}).html(badge.name)), $("<p>", {class: "completed"}).html(badge.description));
			$achievements.append($achievement);
		};
});

var ModalPopupInstanceCtrl = function ($scope, $modalInstance, Badge, badge) {

	$scope.badge = badge

	$scope.cancel = function() {
		$modalInstance.dismiss('cancel');
	};
	
};


