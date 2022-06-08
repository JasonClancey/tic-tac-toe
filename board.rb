class Board
  attr_reader :positions, :game_over

  def initialize
    @positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @game_over = false
    @WINNERS = [
      [6, 7, 8],
      [3, 4, 5],
      [0, 1, 2],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]
      ]
  end

  def check_winners
    @WINNERS.each do |winner|
      if [positions[winner[0]], positions[winner[1]], positions[winner[2]]].all?('X')
        puts 'Player 1 wins!'
        @game_over = true
      elsif [positions[winner[0]], positions[winner[1]], positions[winner[2]]].all?('O')
        puts 'Player 2 wins!'
        @game_over = true
      end
    end
  end

  def show_board
    puts    "
            -----------
             #{positions[6]} | #{positions[7]} | #{positions[8]}
            ---+---+---
             #{positions[3]} | #{positions[4]} | #{positions[5]}
            ---+---+---
             #{positions[0]} | #{positions[1]} | #{positions[2]}
            -----------
            "
  end

  def board_filled?
    if @positions.all? { |position| position.instance_of?(String) } && game_over == false
      puts 'Tie game!'
      @game_over = true
    end
  end
end