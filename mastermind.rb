class Game
  require_relative "player.rb"
  require_relative "computer.rb"

  def initialize
    @player = Player.new
    @computer = Computer.new
    @turn = 1
    start_game
  end

  def start_game
    puts "Welcome to Mastermind! Your color options are red, blue, green, yellow, orange, purple, white, and black.
    \nWhen you are shown your results, an 'X' your color placement corresponded both the correct color and the correct location! An '0' means it didn't.
    \nYou have twelve turns to crack the computer's code.  Best of luck."
    turn
  end

  def turn
    while @turn < 12
      get_player_input
      compare
      @turn += 1
      if @turn == 12
        puts "Unfortunately, you didn't guess the computer's code in the allotted 12 turns.  Better luck next time!"
        exit
      end
    end
  end

  def get_player_input
    puts "\nPlease make your selection! Enter colors in lowercase, separated by spaces, with no commas."
    @player.player_colors = gets.chomp
  end

  def compare
    p_colors = @player.player_colors.downcase.split(" ")
    c_colors = @computer.computer_colors
    correct_indexes = []
    correct_colors = []

    p_colors.zip(c_colors).map { |a, b|
      if a == b
        correct_indexes << "X"
      else correct_indexes << "O"       end
    }

    p_colors.each { |color|
      c_colors.any? { |c_color|
        correct_colors << color if c_color == color
      }
    }

    puts correct_indexes.join(" ")
    puts "Colors guessed correctly: #{correct_colors.join(", ")}"

    #checks win condition
    if correct_indexes.all? { |index| index == "X" }
      puts "You won!"
      exit
    end
  end
end

game = Game.new
