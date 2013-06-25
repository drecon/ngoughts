describe "Board winning states", ->
  beforeEach ->
    @board = new Board

  stubGrid = (grid, replacement) ->
    for row, y in grid
      for cell, x in row
        grid[x][y].marker = replacement[x][y]

  it "is true when the board has been won on a row", ->
    stubGrid(@board.grid, [
      ['X', 'X', 'X'],
      ['O', 'O', ' '],
      [' ', ' ', ' ']
    ])

    expect(@board.winningMove('X')?).toBe(true)
    expect(@board.winningMove('O')?).toBe(false)

    stubGrid(@board.grid, [
      ['O', 'O', ' '],
      ['X', 'X', 'X'],
      [' ', ' ', ' ']
    ])

    expect(@board.winningMove('X')?).toBe(true)
    expect(@board.winningMove('O')?).toBe(false)

    stubGrid(@board.grid, [
      ['O', 'O', ' '],
      [' ', ' ', ' ']
      ['X', 'X', 'X'],
    ])

    expect(@board.winningMove('X')?).toBe(true)
    expect(@board.winningMove('O')?).toBe(false)
  
  it "is true when the board has been won on a column", ->
    stubGrid(@board.grid, [
      ['X', ' ', 'O'],
      ['X', ' ', 'O'],
      ['X', ' ', ' ']
    ])

    expect(@board.winningMove('X')?).toBe(true)
    expect(@board.winningMove('O')?).toBe(false)

    stubGrid(@board.grid, [
      [' ', 'X', ' '],
      ['O', 'X', ' '],
      ['O', 'X', ' ']
    ])

    expect(@board.winningMove('X')?).toBe(true)
    expect(@board.winningMove('O')?).toBe(false)

    stubGrid(@board.grid, [
      [' ', 'O', 'X'],
      [' ', 'O', 'X'],
      [' ', ' ', 'X']
    ])

    expect(@board.winningMove('X')?).toBe(true)
    expect(@board.winningMove('O')?).toBe(false)

  it "is true when the board has been won on a diagonal", ->
    stubGrid(@board.grid, [
      ['X', 'O', 'O'],
      [' ', 'X', ' '],
      [' ', ' ', 'X']
    ])

    expect(@board.winningMove('X')?).toBe(true)
    expect(@board.winningMove('O')?).toBe(false)

    stubGrid(@board.grid, [
      ['O', 'O', 'X'],
      [' ', 'X', ' '],
      ['X', ' ', ' ']
    ])

    expect(@board.winningMove('X')?).toBe(true)
    expect(@board.winningMove('O')?).toBe(false)
