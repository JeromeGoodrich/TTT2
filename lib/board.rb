class Board

  attr_reader :size, :board
  def initialize(size)
    @size = size
    @board = (1..(@size)).to_a
  end

  def rows
    board.each_slice(depth).to_a
  end

  def columns
    column = []
    array_of_columns = []
    first_of_columns = (0..depth).to_a
    count = 0

    first_of_columns.each do |first_of_column|
      while count <= depth - 1
        column << @board[first_of_column + (depth*count)]
        count +=1
      end
      array_of_columns << column
      return array_of_columns
    end
  end

  def diagonal
    count = 0
    diagonal_spaces = []
      while count <= depth-1
        diagonal_spaces << @board[0 + ((depth+1)*count)]
        count += 1
      end
      return diagonal_spaces
  end

  def reverse_diagonal
    count = 0
    reverse_diagonal_spaces = []
    while count <= depth-1
      reverse_diagonal_spaces << @board[(depth-1) +((depth-1)*count)]
      count += 1
    end
    return reverse_diagonal_spaces
  end

  def depth
    Math.sqrt(size)
  end

  def is_move_valid?
    if available_spaces.include?(move)
     return true
    else
      return "invalid move"
    end
  end

  def set_move(move, token)
    board[(move-1)] = token
  end

  def read_move(move)
    board[(move-1)]
  end

  def available_spaces
    board - ["x","o"]
  end

  def winning_row?
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
