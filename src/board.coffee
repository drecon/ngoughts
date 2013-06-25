class @Board
  SIZE = 3
  EMPTY  = ' '
  NOUGHT = 'O'
  CROSS  = 'X'
  PLAYER_MARKERS = [NOUGHT, CROSS]

  constructor: ->
    @reset()

  reset: ->
    @won = false
    @current_player = 0

    @grid = [1..SIZE].map ->
      [1..SIZE].map ->
        new Cell(EMPTY)

  playCell: (cell) ->
    return if cell.hasBeenPlayed()
    return if @won

    cell.mark(@currentPlayerMarker())

    if move = @winningMove(@currentPlayerMarker())
      @won = true
      cell.winning = true for cell in move
    else
      @switchPlayer()

  currentPlayerMarker: ->
    PLAYER_MARKERS[@current_player]

  switchPlayer: ->
    @current_player ^= 1

  cellAt: (x, y) ->
    @grid[x][y]

  winningMove: (marker) ->
    @_winningRow(@grid, marker) ||
    @_winningColumn(@grid, marker) ||
    @_winningDiagonal(@grid, marker)

  _winningRow: (grid, marker) ->
    # do any of the rows have the marker in every cell?
    _(grid).find (row) ->
      _(row).all (cell) ->
        cell.marker == marker

  _winningColumn: (grid, marker) ->
    # transpose the grid and treat as a row
    @_winningRow(_.zip.apply(null, grid), marker)

  _winningDiagonal: (grid, marker) ->
    _cellMatches = (cell) -> cell.marker == marker

    # take all the cells from top left to bottom right
    diagonal = (grid[n][n] for n in [0..SIZE-1])
    return diagonal if _(diagonal).all(_cellMatches)

    # take all the cells from top right to bottom left
    antidiagonal = (grid[n][SIZE-1 - n] for n in [0..SIZE-1])
    return antidiagonal if _(antidiagonal).all(_cellMatches)

    undefined

  class Cell
    constructor: (@marker, @winning=false) ->

    mark: (@marker) ->

    hasBeenPlayed: ->
      @marker != EMPTY
