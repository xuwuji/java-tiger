var indexApp = angular.module('index', []);

indexApp.controller('indexController', ['scope', function ($scope) {

    $scope.content = [{
        'title': 'aa',
        'time': '1238123812',
        'author': 'xuwuji',
        'intro': 'test',
        'comment': 0,
        'category': 'abc'
    }];

}]);
