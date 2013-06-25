'use strict'

app = angular.module('ngOughts', [])

app.controller("BoardCtrl", ($scope) ->
  $scope.board = new Board
)
