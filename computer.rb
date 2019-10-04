class Computer
  attr_accessor :computer_colors

  def initialize
    @colors = ["red", "blue", "green", "yellow", "orange", "purple", "white", "black"]
    @computer_colors = @colors.sample(4)
  end
end
