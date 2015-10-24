class Board
  attr_reader :size, :array_of_spaces
  XTOKEN = "x"
  OTOKEN = "o"

  def initialize(size)
    @size = size
    @array_of_spaces = Array.new(@size)
  end

  def token
    if size.odd? && available_spaces.count.even?
      return OTOKEN
    elsif size.even? && available_spaces.count.odd?
      return OTOKEN
    else
      return XTOKEN
    end
  end

  def rows
    array_of_spaces.each_slice(depth).to_a
  end

  def columns
    rows.transpose
  end

  def diagonal
    count = 0
    diagonal_spaces = []
      while count <= depth-1
        diagonal_spaces << @array_of_spaces[0 + ((depth+1)*count)]
        count += 1
      end
      return diagonal_spaces
  end

  def reverse_diagonal
    count = 0
    reverse_diagonal_spaces = []
    while count <= depth-1
      reverse_diagonal_spaces << @array_of_spaces[(depth-1) +((depth-1)*count)]
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
    array_of_spaces[(move-1)] = token
    return self
  end

  def read_move(move)
    array_of_spaces[(move-1)]
  end

  def available_spaces
    a = []
    array_of_spaces.each_with_index do |space, index|
      if space.nil?
        a << (index+1)
      end
    end
    return a
  end

  def winning_row?
    rows.each do |row|
      row -= [token]
      if row.empty?
        return true
        break
      end
    end
    return false
  end

  def winning_column?
    columns.each do |column|
      column -= [token]
      if column.empty?
        return true
        break
      end
    end
    return false
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
    return false
  end

  def tie_game?
    if !winning_row? && !winning_column? && !winning_diagonal? && available_spaces.empty?
      return true
    else
      return false
    end
  end

  def someone_won?
    winning_row? || winning_column? || winning_diagonal?
  end

  def game_over?
    someone_won? || tie_game?
  end

  def reset_move(move)
    array_of_spaces[move - 1] = move
  end
end
