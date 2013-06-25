describe "Board", ->
  beforeEach ->
    @board = new Board

  describe "playCell", ->
    beforeEach ->
      @cell = @board.grid[0][0]

    it "marks the given cell with the current player's marker", ->
      @board.playCell(@cell)
      expect(@cell.marker).toEqual('O')

    it "switches the current player", ->
      @board.playCell(@cell)
      expect(@board.current_player).toEqual(1)

    describe "when the given cell has already been player", ->
      beforeEach ->
        @board.playCell(@cell)

      it "does not change the cell marker", ->
        @board.playCell(@cell)
        expect(@cell.marker).toEqual('O')

      it "does not switch players", ->
        @board.playCell(@cell)
        expect(@board.current_player).toEqual(1)
    
  describe "currentPlayerMarker", ->
    it "is 'O' for player 0", ->
      expect(@board.currentPlayerMarker()).toEqual('O')

    it "is 'X' for player 1", ->
      @board.switchPlayer()
      expect(@board.currentPlayerMarker()).toEqual('X')

  describe "switchPlayer", ->
    it "switches the current_player on successive calls", ->
      expect(@board.current_player).toEqual(0)

      @board.switchPlayer()
      expect(@board.current_player).toEqual(1)

      @board.switchPlayer()
      expect(@board.current_player).toEqual(0)
