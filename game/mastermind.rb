class Game
  require_relative "codebreaker.rb"
  require_relative "codemaker.rb"

  def initialize
    @code_breaker = Codebreaker.new
    @code_maker = Codemaker.new
    @turn = 1
    start_game
  end

  def start_game
    puts "Welcome to Mastermind!
    \nRules: 
    \nThe codemaker creates a code consisting of four colors chosen from the provided list.  
    It is the goal of the codebreaker to crack the code in 12 turns, entering the same exact colors in the same order.  To attempt to crack the code, simply
    keep guessing.  
    \nYou may choose from the following colors: red, blue, green, yellow, orange, purple, white, and black."
    @code_maker.make_code
    turn
  end

  def turn
    while @turn < 12
      code_breaker_input
      compare
      @turn += 1
      if @turn == 12
        puts "Unfortunately, you didn't guess the codemaker's code in the allotted 12 turns.  Better luck next time!"
        exit
      end
    end
  end

  def code_breaker_input
    puts "\nCodebreaker, please make your selection! Enter colors in lowercase, separated by spaces, with no commas."
    @code_breaker.colors = gets.chomp
  end

  def compare
    b_colors = @code_breaker.colors.downcase.split(" ")
    m_colors = @code_maker.code_colors
    correct_indexes = []
    correct_colors = []

    b_colors.zip(m_colors).map { |a, b|
      if a == b
        correct_indexes << "X"
      else correct_indexes << "O"       end
    }

    b_colors.each { |color|
      m_colors.any? { |c_color|
        correct_colors << color if c_color == color
      }
    }

    puts correct_indexes.join(" ")
    puts "Colors guessed correctly: #{correct_colors.join(", ")}"

    #checks win condition
    if correct_indexes.all? { |index| index == "X" }
      puts "The codemaker cracked the code!"
      exit
    end
  end
end

game = Game.new
