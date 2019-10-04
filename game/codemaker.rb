require 'io/console'

class Codemaker
  attr_accessor :code_colors

  def make_code
    puts "\nCodemaker, select 4 colors! Please enter them separated by spaces, with no commas.  To prevent cheating, your input will be hidden.  Try to not make any typos :)"
    input = STDIN.noecho(&:gets).chomp
    @code_colors = input.split(" ")
    puts "Excellent!"
  end
end
