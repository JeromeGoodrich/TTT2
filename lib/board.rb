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
    depth = Math.sqrt(@rows*@columns)
    count = 0
    diagonal = []
    reverse_diagonal = []
    while count <= depth -1
      diagonal << @board[0 + ((depth+1)*count)]
      reverse_diagonal << @board[(depth-1) +((depth-1)*count)]
      count += 1
    end
    xdiagonal = diagonal - ["x"]
    odiagonal = diagonal - ["o"]
    xreverse_diagonal = reverse_diagonal - ["x"]
    oreverse_diagonal = reverse_diagonal - ["o"]
    if xdiagonal.empty? || odiagonal.empty?
      return true
    elsif xreverse_diagonal.empty? || oreverse_diagonal.empty?
      return true
    end
  end

  def tie_game?
    unless winning_row? && winning_column? && winning_diagonal? && available_spaces.empty? == false
      return true
    else
      return false
    end
  end
end
