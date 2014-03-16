'use strict';
 
var app = angular.module('app');
 
app.controller('ArticleIndexCtrl', function($scope, Article) {

    $scope.articles = Article.query();
    $scope.destroy = function(index) {
        Article.remove({id: $scope.articles[index].id}, function() {
            $scope.articles.splice(index, 1);
        });
    }
});


app.controller('ArticleShowCtrl', function($scope, Article, Comment, $routeParams) {
    //Grab the forum from the server
    $scope.article = Article.get({id: $routeParams.id})
});

app.controller('ArticleCreateCtrl', function($scope, $location, Article) {
	
	$scope.save = function() {
		
		var forum = new Article($scope.article);
		
		article.$save(function() {
			
			$location.path('/');
			
		}, function(response) {
			
			$scope.errors = response.data.errors;
		});
	}
});