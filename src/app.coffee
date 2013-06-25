'use strict'

app = angular.module('ngOughts', ['ng'])

app.controller("BoardCtrl", ($scope, Board) ->
  $scope.board = new Board
)
