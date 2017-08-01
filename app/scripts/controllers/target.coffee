'use strict'

###*
 # @ngdoc function
 # @name dgsDash.controller:TargetCtrl
 # @description
 # # TargetCtrl
 # Controller of the dgsDash
###
angular.module 'dgsDash'
    .controller 'TargetCtrl', ($scope, $routeParams, $rootScope, $q, lookup, target, goal, indicator) ->
        lookup.refresh()
        $scope.loading = true

        targetq = target.query id: $routeParams.id, (_target) ->
            $scope.target = _target
            $rootScope.title = "#{$rootScope.settings.SITE_NAME} • #{$scope.target.name}"
            goal.query id: $scope.target.goal, (goal) ->
                $scope.goal = goal
            target.query goal: $scope.target.goal, (targets) ->
                $scope.targets = targets

        indicatorsq =indicator.query target: $routeParams.id, (data) ->
            $scope.indicators = data

        $q.all([
            targetq.$promise
            indicatorsq.$promise
        ]).then ->
            $scope.loading = false
            return

        return
