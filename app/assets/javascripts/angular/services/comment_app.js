'use strict';
 
var app = angular.module('app');

app.factory('User', function($resource) {
    return $resource('/users/:id/:action', {id: '@id'}, {currentUser: {method: "GET"}, badges: {method: "GET", isArray: true}});
});

app.factory('Article', function($resource) {
    return $resource('/articles/:id', {id: '@id'});
});
 
app.factory('Comment', function($resource) {
    return $resource('/articles/:articleId/comments/:id/:action', {articleId: '@articleId', id: '@id'}, {upvote: {method: "POST"}, downvote: {method: "POST"}});
});

app.factory('CommentFavorite', function($resource) {
		return $resource('/articles/:articleId/comments/:commentId/:action', {articleId: '@articleId', commentId: '@commentId'}, {upvote: {method: "POST", isArray: true}});
});


// { "upvote": {method: 'PUT', action: 'upvote'}, "downvote": {method: 'PUT', action: 'downvote'} }