'use strict'

angular.module('cljangApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.niceThings = [
      'Clojure',
      'AngularJS',
      'CoffeeScript',
      'Sass',
      'Grunt',
      'Bower'
    ]
