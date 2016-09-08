var indexApp = angular.module('index', ['ngRoute']);


indexApp.config(['$routeProvider', '$locationProvider', function ($routeProvider, $locationProvider) {
    $routeProvider.
    when('/detail/:id', {
        templateUrl: './template/detail/content.html',
        controller: 'contentController'
    }).
    when('/', {
        templateUrl: './template/index/post.html',
        controller: 'postController'
    }).
    when('/category/:category', {
        templateUrl: './template/index/post.html',
        controller: 'postController'
    }).
    when('/archive/:archive', {
        templateUrl: './template/index/post.html',
        controller: 'postController'
    })
}]);

indexApp.controller('postController', ['$scope', '$http', function ($scope, $http) {

    $scope.content = getContent1();

    $scope.pageInfo = {
        current: 1,
        total: 3
    }

    function getPageInfo($http) {

    }

    $scope.previousPage = function () {
        //$http.get('http://www.baidu.com', function (data) {});
        $scope.pageInfo.current = $scope.pageInfo.current - 1;
        $scope.content = getContent1();
    }

    $scope.nextPage = function () {
        $scope.pageInfo.current = $scope.pageInfo.current + 1;

        $scope.content = getContent2();
        console.log(getContent2());
    }

}]);


indexApp.controller('silderController', ['$scope', '$http', function ($scope, $http) {
    $scope.recent = getRecent();
    $scope.comment = getComment();
    $scope.archive = getArchive();
    $scope.category = getCategory();
}]);

indexApp.controller('contentController', ['$scope', '$routeParams', function ($scope, $routeParams) {
    $scope.id = $routeParams.id;
    $scope.detail = getDetail();
    //console.log($scope.detail);
}]);
