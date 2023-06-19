class BoardData
    def initialize(puzzle_string)
        rawData = puzzle_string.replace(/[^0-9.]/, '')
        @board = Array.new(9) { Array.new(9) }
        rawData.split('').each_with_index do |value, index|
            @board[index / 9][index % 9] = value.to_i
        end
    end