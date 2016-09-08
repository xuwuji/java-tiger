var adminApp = angular.module('admin', ['ngRoute', 'ckeditor']);


adminApp.config(['$routeProvider', '$locationProvider', function ($routeProvider, $locationProvider) {
    $routeProvider.
    when('/', {
        templateUrl: './template/admin/write.html',
        controller: 'writeController'
    });
}]);

adminApp.controller('writeController', ['$scope', '$routeParams', function ($scope, $routeParams) {
    $scope.options = {
        language: 'en',
        allowedContent: true,
        entities: false
    };
    $scope.$watch('content', function (oldV, newV, scope) {
        console.log($scope.content);
    }, true)

}]);
