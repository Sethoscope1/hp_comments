'use strict';
 
var app = angular.module('app');

angular.module('app').filter('fromNow', function() {
  return function(date) {
    return moment(date).fromNow();
  }
});

app.controller('CommentCtrl', function($scope, Comment, User, CommentFavorite, $routeParams, $location) {
    $scope.comments = Comment.query({articleId: $routeParams.id});		
		$scope.currentUser = User.currentUser({ action: 'currentUser' });
		
		console.log("CURRENT USER:")

		console.log( $scope.currentUser )
		console.log( $scope.currentUser )
		var userIndex = User.query();

    $scope.save = function() {
        var obj = new Comment({ body: $scope.body, articleId: $routeParams.id});
 
        obj.$save(function(response) {
	        $scope.comments.unshift(response);
	        $scope.name = $scope.body = "";
        }, function(response) {
          $scope.errors = response.data.errors;
        });
    }
		
		$scope.getUserName = function(user_id) {

			var user = $.grep(userIndex, function(user){
				return user.id == user_id;
			})[0];
			if(user == undefined) {
				return null;
			}
			return user.username;
		}
		
		$scope.upvote = function(comment, $event) {
			comment.$upvote({articleId: $routeParams.id, commentId: comment.id, action: 'upvote'}, function(response) {
			})
		};
		
		$scope.downvote = function(comment, $event) {
			comment.$downvote({articleId: $routeParams.id, commentId: comment.id, action: 'downvote'}, function(response) {	
			})
		}
});