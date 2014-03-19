'use strict';
 
var app = angular.module('app');

app.factory('User', function($resource) {
    return $resource('/users/:id/:action', {id: '@id'}, {currentUser: {method: "GET"}, badges: {method: "GET", isArray: true, id: ""}});
});

app.factory('Badge', function($resource) {
	return $resource('/badges');
});

app.factory('UserBadge', function($resource) {
	return $resource('/user_badges');
});

app.factory('Article', function($resource) {
    return $resource('/articles/:id', {id: '@id'});
});
 
app.factory('Comment', function($resource) {
    return $resource('/articles/:articleId/comments/:id/:action', {articleId: '@articleId', id: '@id'}, {upvote: {method: "POST"}, downvote: {method: "POST"}});
});

app.factory('CommentFavorite', function($resource) {
		return $resource('/articles/:articleId/comments/:commentId/:action', {articleId: '@articleId', commentId: '@commentId'});
});

