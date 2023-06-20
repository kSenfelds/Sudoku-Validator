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
    hashRows = {
      "row1" => numbers[0..8],
      "row2" => numbers[9..17],
      "row3" => numbers[18..26],
      "row4" => numbers[27..35],
      "row5" => numbers[36..44],
      "row6" => numbers[45..53],
      "row7" => numbers[54..62],
      "row8" => numbers[63..71],
      "row9" => numbers[72..80]
    }
    hashRows

  end

  def getColumns(numbers)
    hashColumns = {
      "column1" => numbers[0] + numbers[9] + numbers[18] + numbers[27] + numbers[36] + numbers[45] + numbers[54] + numbers[63] + numbers[72],
      "column2" => numbers[1] + numbers[10] + numbers[19] + numbers[28] + numbers[37] + numbers[46] + numbers[55] + numbers[64] + numbers[73],
      "column3" => numbers[2] + numbers[11] + numbers[20] + numbers[29] + numbers[38] + numbers[47] + numbers[56] + numbers[65] + numbers[74],
      "column4" => numbers[3] + numbers[12] + numbers[21] + numbers[30] + numbers[39] + numbers[48] + numbers[57] + numbers[66] + numbers[75],
      "column5" => numbers[4] + numbers[13] + numbers[22] + numbers[31] + numbers[40] + numbers[49] + numbers[58] + numbers[67] + numbers[76],
      "column6" => numbers[5] + numbers[14] + numbers[23] + numbers[32] + numbers[41] + numbers[50] + numbers[59] + numbers[68] + numbers[77],
      "column7" => numbers[6] + numbers[15] + numbers[24] + numbers[33] + numbers[42] + numbers[51] + numbers[60] + numbers[69] + numbers[78],
      "column8" => numbers[7] + numbers[16] + numbers[25] + numbers[34] + numbers[43] + numbers[52] + numbers[61] + numbers[70] + numbers[79],
      "column9" => numbers[8] + numbers[17] + numbers[26] + numbers[35] + numbers[44] + numbers[53] + numbers[62] + numbers[71] + numbers[80]
    }
    hashColumns

  end

  def getBoxes(numbers)
    hashBox = {
      "box1" => numbers[0..2] + numbers[9..11] + numbers[18..20],
      "box2" => numbers[3..5] + numbers[12..14] + numbers[21..23],
      "box3" => numbers[6..8] + numbers[15..17] + numbers[24..26],
      "box4" => numbers[27..29] + numbers[36..38] + numbers[45..47],
      "box5" => numbers[30..32] + numbers[39..41] + numbers[48..50],
      "box6" => numbers[33..35] + numbers[42..44] + numbers[51..53],
      "box7" => numbers[54..56] + numbers[63..65] + numbers[72..74],
      "box8" => numbers[57..59] + numbers[66..68] + numbers[75..77],
      "box9" => numbers[60..62] + numbers[69..71] + numbers[78..80]
    }
    hashBox
  end
end

