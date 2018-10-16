class Board

  attr_accessor :board

  def initialize

    @board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  def display_board

    puts "\n #{@board[0]} | #{@board[1]} | #{@board[2]}"

    puts "-----------"

    puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"

    puts "-----------"

    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} \n\n"

  end

  def play(array)

    if @board[array[2]] == 1 || 2 || 3 || 4 || 5 || 6 || 7 || 8 || 9
      if array[1] == "X"
        @board[array[2]] = "X".colorize(:red)
      else
        @board[array[2]] = "O".colorize(:blue)
      end
    else
      puts "Dommage ! ton tour est sauté !"
    end
  end


  def victory?

    case

    when @board[0] == @board[1] && @board[0] == @board[2] && @board[0] != "1" && @board[1] != "2" && @board[2] != "3"
      return true

    when @board[3] == @board[4] && @board[3] == @board[5] && @board[3] != "4" && @board[4] != "5" && @board[5] != "6"
      return true

    when @board[6] == @board[7] && @board[6] == @board[8] && @board[6] != "7" && @board[7] != "8" && @board[8] != "9"
      return true

    when @board[0] == @board[3] && @board[0] == @board[6] && @board[0] != "1" && @board[3] != "4" && @board[6] != "7"
      return true

    when @board[2] == @board[5] && @board[2] == @board[8] && @board[2] != "3" && @board[2] != "3" && @board[8] != "9"
      return true

    when @board[0] == @board[4] && @board[0] == @board[8] && @board[0] != "1" && @board[4] != "5" && @board[8] != "9"
      return true

    when @board[2] == @board[4] && @board[2] == @board[6] && @board[2] != "3" && @board[4] != "5" && @board[6] != "7"
      return true

    when @board[1] == @board[4] && @board[1] == @board[7] && @board[1] != "2" && @board[4] != "5" && @board[7] != "8"      
      return true

    else

      return false
    end
  end
end