class Validator
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate    
  end

  def validate
     numbers = @puzzle_string.gsub(/[^0-9.]/, '')
      rows = getRows(numbers)
      columns = getColumns(numbers)
      boxes = getBoxes(numbers)
    
      if !isValid_length(numbers) || hasDuplicates(rows) || hasDuplicates(columns) || hasDuplicates(boxes)
        return "Sudoku is invalid."
      elsif hasZeros(numbers)
        return "Sudoku is valid but incomplete."
      else
        return "Sudoku is valid."
      end
  end

  def isValid_length(numbers)
    if numbers.length != 81
      return false
    end
    true
  end

  def hasZeros(numbers)
    if isValid_length(numbers)&& numbers.include?("0")
      return true
    end
    false
  end

  def hasDuplicates(hash)
    hash.each do |key, value|
      if value.chars.reject { |c| c == '0' }.uniq.length != value.chars.reject { |c| c == '0' }.length
        return true
      end
    end
    false
  end

  def getRows(numbers)
    hashRows = {}
  
    (0..8).each do |row_index|
      row_key = "row#{row_index + 1}"
      start_index = row_index * 9
      end_index = start_index + 8
      hashRows[row_key] = numbers[start_index..end_index]
    end
  
    hashRows
  end

  def getColumns(numbers)
    hashColumns = Hash.new('')
  
    numbers.each_char.with_index do |number, index|
      column_key = "column#{(index % 9) + 1}"
      hashColumns[column_key] += number
    end
  
    hashColumns
  end

  def getBoxes(numbers)
    hashBox = {}
  
    9.times do |i|
      box_key = "box#{i + 1}"
      start_index = (i / 3) * 27 + (i % 3) * 3
      box_values = numbers[start_index..(start_index + 2)] +
                   numbers[start_index + 9..start_index + 11] +
                   numbers[start_index + 18..start_index + 20]
  
      hashBox[box_key] = box_values
    end
  
    hashBox
  end
end