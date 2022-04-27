class Game

  attr_reader :board

  require_relative 'board'

  def initialize
    @board = Board.new
    @turn = 1
    board.show_board
  end

  def valid_move?(i)
    current_turn = @turn
    if i == board.positions[i - 1] && @turn == 1
      board.positions[i - 1] = 'X'
      @turn += 1
    elsif i == board.positions[i - 1] && @turn == 2
      board.positions[i - 1] = 'O'
      @turn -= 1
    else
      puts "Invalid entry, please try again Player #{@turn}."
      @turn = current_turn
    end
  end

  def take_turn
    if @turn == 1 && board.game_over == false
      puts "Player 1, enter the position (1-9) you would like to place your marker:"
      i = gets.to_i
      valid_move?(i)
      board.show_board
      board.check_winners
      board.board_filled?
    end


    if @turn == 2 && board.game_over == false
      puts "Player 2, enter the position (1-9) you would like to place your marker:"
      i = gets.to_i
      valid_move?(i)
      board.show_board
      board.check_winners
      board.board_filled?
    end
  end
end

game = Game.new

while game.board.game_over == false
  game.take_turn
end
