---
title: "Combine ng-pattern and ng-if"
date: 2016-02-25T10:00:42+01:00
draft: false

tags: 
  - validation
  - angular
  - 2016
---

I implemented a validation pattern directive, that only gets validated if `ng-required="true"`. Usage:

```
 <input ng-required="isRequired()" ng-pattern-if-required="myPattern" name="myName">
```

The directive:

```
 angular.module('directives')
.directive('ngPatternIfRequired', ['underscore', function (_) {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function (scope, elem, attrs, ctrl) {

            var required = true;
            var pattern = attrs.ngPatternIfRequired;
            if (_.isNull(pattern) || _.isUndefined(pattern)) {
                throw 'regular expression in ngPatternIfRequired is undefined';
            }

            var re = new RegExp(pattern.substring(1, pattern.length - 1));

            var validate = function() {
                var pass = false;
                if (_.isNull(required) || _.isUndefined(required) || !required) {
                    pass = true;
                } else {
                    pass = re.test(ctrl.$viewValue);
                }
                ctrl.$setValidity('requiredPattern', pass);
            };

            ctrl.$parsers.push(function(value) {
                if(!required || (_.isString(value) &amp;&amp; value.length &gt; 1)) {
                    validate();
                    return value;
                }
                validate();
            });

            var deregisterWatchRequired = scope.$watch(attrs.ngRequired, function (newval) {
                required = newval;
                validate();
            });

            var deregisterWatchModel = scope.$watch(attrs.ngModel, function () {
                validate();
            });

            scope.$on('$destroy', function () {
                deregisterWatchModel();
                deregisterWatchRequired();
            });
        }
    };
}]);

```

The test:
```
 describe('ngPatternIfRequired', function () {
    var $rootScope;
    var $compile;

    beforeEach(module('adminNg'));
    beforeEach(module('adminNg.directives'));

    beforeEach(module(function ($provide) {
        var service = {
            configureFromServer: function () {},
            getLanguageCode: function () { return 'en'; }
        };
        $provide.value('Language', service);
    }));

    beforeEach(inject(function (_$rootScope_, _$compile_) {
        $rootScope = _$rootScope_;
        $compile = _$compile_;
    }));

    describe('#valid-pattern', function() {

        var element, $scope;
        beforeEach(inject(function () {
            element = $compile('&lt;form name="myForm"&gt;&lt;input ng-required="myRequired" ng-pattern-if-required="/[0-9]{4}/" ng-model="myModel" name="myInput"/&gt;&lt;/form&gt;')($rootScope);
            $scope = element.scope();
            $scope.$digest();

            $scope.myRequired = false;

            expect($scope.myModel).toBeUndefined();
        }));

        it('form is invalid for required=false', function () {

            $scope.myRequired = false;
            $scope.myModel = 'something invalid';

            $scope.$digest();

            expect($scope.myForm.$valid).toBe(true);
        });


        it('form is valid for valid data with required=true', function () {

            $scope.myRequired = true;

            $scope.myModel = '1234';
            $scope.$digest();
            expect($scope.myForm.$valid).toBe(true);

            $scope.myModel = 1234;
            $scope.$digest();
            expect($scope.myForm.$valid).toBe(true);
        });

        it('form is invalid for invalid data with required=true', function () {

            $scope.myRequired = true;
            $scope.myModel = 'something invalid';

            $scope.$digest();

            expect($scope.myForm.$valid).toBe(false);
        });

        it('form is valid for required=null or undefined', function () {

            $scope.myModel = null;

            $scope.myRequired = null;
            $scope.$digest();

            expect($scope.myForm.$valid).toBe(true);

            $scope.myRequired = undefined;
            $scope.$digest();

            expect($scope.myForm.$valid).toBe(true);
        });

        it('form is invalid for null model with required=true', function () {

            $scope.myRequired = true;
            $scope.myModel = null;
            $scope.$digest();

            expect($scope.myForm.$valid).toBe(false);

            $scope.myModel = undefined;
            $scope.$digest();

            expect($scope.myForm.$valid).toBe(false);
        });

    });

});
```
