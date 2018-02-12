class Card
  attr_accessor :rank, :suit, :color

  def initialize(rank, suit, color)
    @rank = rank
    @suit = suit
    @color = color
  end
end
