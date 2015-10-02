class Board

  def initialize(rows,columns)
    @rows = rows
    @columns = columns
    @board = (1..(@rows*@columns)).to_a
  end

  def set_move(space, token)
    if available_spaces.include?(space)
      @board[(space-1)] = token
    else
      #will need to add this validation elsewhere
      return "invalid move"
      set_move(space, token)
    end
  end

  def read_move(space)
    @board[(space-1)]
  end

  def available_spaces
    @board - ["x","o"]
  end

  def winning_row?
    depth = Math.sqrt(@rows*@columns)
    rows = @board.each_slice(depth).to_a
    rows.each do |row|
      xrow = row - ["x"]
      orow = row - ["o"]
      if xrow.empty? || orow.empty?
        return true
        break
      end
    end
  end

  def winning_column?
    depth = Math.sqrt(@rows*@columns)
    a = []
    columns = []
    starting_points = (0..depth).to_a
    count = 0
    starting_points.each do |starting_point|
      while count <= depth - 1
        a << @board[starting_point + (depth*count)]
      count +=1
      end
      columns << a
    end

    columns.each do |column|
      xcolumn = column - ["x"]
      ocolumn = column - ["o"]
      if xcolumn.empty? || ocolumn.empty?
        return true
        break
      end
    end
  end



  def winning_diagonal?

  end

  def tie_game?
    if winning_row? && winning_column? && winning_diagonal? == false && available_spaces.empty?
      return true
    else
      return false
    end
  end
  def winner?

  end

end
