'use strict'

app = angular.module('ngOughts', ['ng'])

app.controller("BoardCtrl", ($scope) ->
  $scope.board = new Board
)
