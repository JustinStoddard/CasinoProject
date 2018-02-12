require_relative 'deck'
require_relative 'player'
require 'pry'


class Blackjack
  attr_accessor :deck, :player, :dealer  #allows us access to those variables


  def initialize                      #When Blackjack.new , this will run
    deck = Deck.new                   #creates a new instance of Deck from deck.rb
    @deck = deck.cards.shuffle        #Creates variable @deck which is a new shuffled deck
    @player = []                      #creates Dlayer array (hand)
    @dealer = []                      #creates Dealer array (hand)
    start_game                        #runs the start_game method which runs the Blackjack Menu
  end

  def start_game

    puts "=" * 50
    puts "Welcome to Black Jack"
    puts "My name is Francois, I will be your dealer today."
    puts "=" * 50
    deal                      #runs the menu, then deals two cards to Player and Dealer
  end


  def deal
    ptotal = 0
    dtotal = 0
    @player << @deck.pop(2)
    @dealer << @deck.pop(2)
    @player.flatten!
    @dealer.flatten!

    @player.each do |card|
      num = 0
      if card.rank == 'Jack' || 'Queen' || "King"
        num = 10
      elsif card.rank == "Ace"
        num = 11
      else
        num = card.rank.to_i
      end
      ptotal += num

    end
    @dealer.each do |card|
      num = 0
      if card.rank == 'Jack' || 'Queen' || "King"
        num = 10
      elsif card.rank == "Ace"
        num = 11
      else
        num = card.rank.to_i
      end
      dtotal += num
    end
    puts ptotal
    puts dtotal
  end

end #end class Blackjack
Blackjack.new


# player = Player.new
# dealer = Player.new
#
#
# start_game
# deal
