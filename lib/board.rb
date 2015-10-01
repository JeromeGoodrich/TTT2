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
      row = row.flatten
      row -= ["x","o"]
      if row.empty?
        return true
      end
    end
  end

  def winning_column?
    if read_move(1) && read_move(4) && read_move(7) == "x" || "o"
      return true
    elsif read_move(2) && read_move(5) && read_move(8) == "x" || "o"
      return true
    elsif read_move(1) && read_move(2) && read_move(3) == "x" || "o"
      return true
    else
      return false
    end
  end

  def winning_diagonal?
    if read_move(1) && read_move(5) && read_move(9) == "x" || "o"
      return true
    elsif read_move(3) && read_move(5) && read_move(7) == "x" || "o"
      return true
    else
      return false
    end
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
