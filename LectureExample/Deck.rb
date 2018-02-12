require_relative 'card'

class Deck
  attr_accessor :cards

  def initialize
    @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
    @suits = %w(Spades Diamonds Clubs Hearts)
    @cards = []
    generate_deck
  end

  def generate_deck
    @suits.each do |suit|
      @ranks.each do |rank|
        color = (suit == 'Spades' || suit == 'Clubs') ? 'black' : 'red'
        @cards << Card.new(rank, suit, color)
      end
    end
  end

  def shuffle_cards
    @cards.shuffle
  end
end
