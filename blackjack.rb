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
    ptotal = 0                #setting the player score value to 0
    dtotal = 0                #setting the dealer score value to 0
    @player << @deck.pop(2)    #player hand array << popping two cards off the deck into hand
    @dealer << @deck.pop(2)    #dealer hand array << popping two cards off deck into hand
    @player.flatten!          #flattens array of arrays into single array
    @dealer.flatten!          #flattens array of arrays into single array

    @player.each do |card|     #for each card in hand we want to set the value for the card
      num = 0                  #variable num (calue of the card) set to 0
      if card.rank == 'Jack' || card.rank == 'Queen' || card.rank == "King"  #if the card rank: J, Q, K set that value to 10

        num = 10
      elsif card.rank == "Ace"  #if the card is an ace, set the value to 11
        num = 11
      else
        num = card.rank.to_i   #otherwise set the value to the integer version of the rank (2-10)
      end
      ptotal += num           #Player total = 0 + num
    end

    @dealer.each do |card|   #same as above
      num = 0
      if card.rank == 'Jack' || card.rank == 'Queen' || card.rank == "King"
        num = 10
      elsif card.rank == "Ace"
        num = 11
      else
        num = card.rank.to_i
      end
      dtotal += num

    end

    puts "Player has" ptotal   #print player hand total
    puts "Dealer has" dtotal   #print dealer hand total
  end

end
 #end class Blackjack
Blackjack.new     #run an instace of the Blackjack class (start the game up)
