class Validator
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate    
  end

  def validate
     numbers = @puzzle_string.gsub(/[^0-9.]/, '')
     isValid = true
      isValid = false if validate_length(numbers)
      isValid = false if validate_rows(numbers) == false
      isValid = false if validate_columns(numbers) == false
    
      if isValid
        return "Sudoku is valid."
      else
        return "Invalid Sudoku"
      end


    puts numbers
  end

  def validate_length(numbers)
    numbers.length != 81
  end

  def validate_rows(numbers)
    rows = numbers.split('').each_slice(9).to_a
    rows.each do |row|
      return false if row.uniq.length != 9
    end
    true
  end

  def validate_columns(numbers)
    columns = numbers.split('').each_slice(9).to_a.transpose
    columns.each do |column|
      return false if column.uniq.length != 9
    end
    true
  end

end
