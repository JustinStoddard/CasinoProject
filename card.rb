class Card
  attr_accessor :rank, :suit, :color

  def initialize(rank, suit, color)
    @rank = rank
    @suit = suit
    @color = color
  end

  def value
      value = case @rank.to_i
      when 1
          11
        when 2..10
          @rank
        when 11..13
          10
        else
          nil
      end
    end  
end
