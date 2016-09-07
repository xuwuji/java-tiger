indexApp.directive('post', ['$http', function ($http) {

    return {
        restrict: 'E',
        replace: true,
        transclude: false,
        scope: {
            content: '='
        },
        templateUrl: '../../html/template/post.html',

        compile: function () {
            return {
                pre: function ($scope, iElement, iAttrs) {},

                post: function ($scope, iElement, iAttrs) {

                }
            }
        },
    }
            }]);
