require_relative 'deck'
#require_relative 'customer'

#add earnings to a wallet
require 'pry'


class Blackjack
  attr_accessor :deck, :player, :dealer  #allows us access to those variables


  def initialize(customer)
    @customer = customer                #When Blackjack.new , this will run
    deck = Deck.new                  #creates a new instance of Deck from deck.rb
    @deck = deck.cards.shuffle        #Creates variable @deck which is a new shuffled deck
    @player = []                      #creates Dlayer array (hand)
    @dealer = []                      #creates Dealer array (hand)
    start_game                        #runs the start_game method which runs the Blackjack Menu
  end

  def start_game

    puts "=" * 50
    puts "Welcome to Black Jack, #{@customer.name}!"
    puts "My name is Francois, I will be your dealer today."
    puts "You have $#{@customer.wallet} left to bet."
    puts "How much would you like to bet?"
    @bet = gets.to_i
    if @bet > @customer.wallet
      puts "Hmmmmm.  I'm sorry you don't have enough left to place this bet."
      start_game
    end
    if @customer.wallet == 0
      puts "I'm sorry you're out of funds."
      casino.casino_menu
    end
    puts "Okay... Your bet is $#{@bet}."
    puts "..........DEALING CARDS......"
    puts "=" * 50
    deal
    hit                      #runs the menu, then deals two cards to Player and Dealer
  end


  def deal
    @ptotal = 0                #setting the player score value to 0
    @dtotal = 0
    @player = []
    @dealer = []                #setting the dealer score value to 0
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
      end #end
      @ptotal += num           #Player total = 0 + num
    end

    @player.each do |card|
    puts "You were delt a(n) #{card.rank}."
    end


    @dealer.each do |card|   #same as above
      num = 0
      if card.rank == 'Jack' || card.rank == 'Queen' || card.rank == "King"
        num = 10
      elsif card.rank == "Ace"
        num = 11
      else
        num = card.rank.to_i
      end #end if else
      @dtotal += num
    end #end each do
end #end deal
    # @dealer.each do |card|
    # puts "The dealer was delt a(n) #{card.rank}."
    # end

  def hit
    @ptotal2 = 0
    @dtotal2 = 0
    @player << @deck.pop(1)
    @player.flatten!
    puts "You have #{@ptotal}.  If you would like another card, type: 'Hit me'"
    puts "If you would like to hold, type 'Hold'"
    response = gets.strip.downcase
    if response == "hit me"
    @player.each do |card|
      puts "You were delt a(n) #{card.rank}."
      end

    @player.each do |card|     #for each card in hand we want to set the value for the card
          num = 0             #variable num (calue of the card) set to 0
        if card.rank == 'Jack' || card.rank == 'Queen' || card.rank == "King"  #if the card rank: J, Q, K set that value to 10

          num = 10
        elsif card.rank == "Ace"  #if the card is an ace, set the value to 11
          num = 11
        else
          num = card.rank.to_i   #otherwise set the value to the integer version of the rank (2-10)
        end #end if else 2
        @ptotal2 += num           #Player total = 0 + num
      end #end each do
      if @dtotal <= 17
        @dealer.each do |card|   #same as above
          num = 0
          if card.rank == 'Jack' || card.rank == 'Queen' || card.rank == "King"
            num = 10
          elsif card.rank == "Ace"
            num = 11
          else
            num = card.rank.to_i
          end #end if else
          @dtotal2 += num

        end #end each do
      end
      puts "Player has #{@ptotal2}"   #print player hand total
      puts "Dealer has #{@dtotal2}"   #print dealer hand total
      if  @ptotal2 > 21 && @dtotal2 > 21
        puts "PUSH"
        puts "You have $#{@customer.wallet} left to bet."
      elsif @ptotal2.to_i == 21
        puts "BLACKJACK!"
        @customer.wallet += @bet * 1.5
        puts "You have $#{@customer.wallet} left to bet."
      elsif @ptotal2 > 21
        puts "You lose."
        @customer.wallet -= @bet
        puts "You have $#{@customer.wallet} left to bet."
        elsif @dtotal2.to_i > @ptotal2.to_i
          puts "You Lose!"
          @customer.wallet -= @bet
          puts "You have $#{@customer.wallet} left to bet."
        elsif @ptotal2.to_i > @dotal2.to_i
          puts "You Win!"
          @customer.wallet += @bet
          puts "You have $#{@customer.wallet} left to bet."
        elsif @ptotal2.to_i == @dtotal2.to_i
          puts "PUSH!"
          puts "You have $#{@customer.wallet} left to bet."
        elsif @ptotal2.to_i == 21
          puts "BLACKJACK!"
          @customer.wallet += @bet * 1.5
          puts "You have $#{@customer.wallet} left to bet."
      end

    else response == "hold"
      end_game
    end #end if else
    puts "Would you like to play again? Y/N"
    play = gets.strip.downcase
    if play == "y"
      start_game
    elsif play == "n"
      exit
    end
end #end hit

def end_game
  puts "Player has #{@ptotal}"   #print player hand total
  puts "Dealer has #{@dtotal}"   #print dealer hand total
  if  @ptotal.to_i > 21
    puts "You Lose"
    @customer.wallet -= @bet
    puts "You have $#{@customer.wallet} left to bet."
  elsif @ptotal.to_i == 21
    puts "BLACKJACK!"
    @customer.wallet += @bet * 1.5
    puts "You have $#{@customer.wallet} left to bet."
    elsif @dtotal.to_i > @ptotal.to_i
      puts "You Lose!"
      @customer.wallet -= @bet
      puts "You have $#{@customer.wallet} left to bet."
    elsif @ptotal.to_i > @dotal.to_i
      puts "You Win!"
      @customer.wallet += @bet
      puts "You have $#{@customer.wallet} left to bet."
    elsif @ptotal.to_i == @dtotal.to_i
      puts "PUSH!"
      puts "You have $#{@customer.wallet} left to bet."

    else
      puts "Push"
  end
  puts "Would you like to play again? Y/N"
  play = gets.strip.downcase
  if play == "y"
    start_game
  elsif play == "n"
    exit
  end

end


end #end
