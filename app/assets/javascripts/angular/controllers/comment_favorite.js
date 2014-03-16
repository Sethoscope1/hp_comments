'use strict';
 
var app = angular.module('app');
 
app.controller('CommentFavoriteIndexCtrl', function($scope, CommentFavorite) {
    $scope.commentFavorites = CommentFavorite.query();
});

app.controller('CommentFavoriteCtrl', function($scope, CommentFavorite) {
})