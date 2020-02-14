class  TicTacToe
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i. - 1
  end
  
  def move(index, current_player="X")
    @board[index] = current_player
  end

  def position_taken?(index)
    if (@board[index] == nil || @board[index] == " ")
      false 
    else 
      true 
    end 
  end
  
  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      true 
    end
  end
  
  def turn_count
    turn = 0
    @board.each do |index|
    if index == "X" || index == "O"
      turn += 1
    end
  end
  return turn
end

  def current_player
    num_turns = turn_count
    if num_turns.even?
      player = "X"
    else
      player = "O"
    end
    return player
  end

  def turn
    puts "Please choose a number 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else 
        turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.each {|win_combo|
    position_1 = @board[win_combo[0]]
    position_2 = @board[win_combo[1]]
    position_3 = @board[win_combo[2]]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo 
    elsif position_1 == "O" && position_2 == "O" && position_3 == "0"
      return win_combo 
    end
    }
    return false  
  end
  
  def full?
    @board.all? {|index| index == "X" || index == "O"}
  end 

  def draw?
    if full? && !won?
      true 
    elsif won?
      false
    else 
      false 
    end 
  end 
  
  def over?
    if won? || full? || draw?
      true 
    else
      false 
    end 
  end 
  
  def winner
  WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return "X"
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return "O"
    else
      nil
    end
  end
end
  
  def play
    until over? == true
    turn
  end
    if won?
      winner == "X" || winner == "O"
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end