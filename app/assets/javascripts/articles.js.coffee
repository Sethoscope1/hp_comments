# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


app = angular.module("hp_comments", ["ngResource"])


app.factory "Article", ["$resource", ($resource) ->
	$resource("/articles/:id.json", {id: "@id"}, {update: {method: "PUT"}})]
	
@ArticleCtrl = ["$scope", "Article", ($scope, Article) ->
	# Index function
	$scope.articles = Article.query()]
	
app.factory "Comment", ["$resource", ($resource) ->
	$resource("/comments/:id.json", {id: "@id"}, {update: {method: "PUT"}})]
	
@CommentCtrl = ["$scope", "Comment", ($scope, Comment) ->
	$scope.comments = Comment.query()]
	
app.factory "User", ["$resource", ($resource) ->
	$resource("/users/:id.json", {id: "@id"}, {update: {method: "PUT"}, current: {method: "GET", isArray: false}})]
	
@UserCtrl = ["$scope", "User", ($scope, User) ->
  $scope.current = User.current()]

