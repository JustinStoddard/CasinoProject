require_relative 'customer'

require_relative 'deck'

#deck array should be hashes with three keys - number, suit, value

class Poker
  attr_accessor :customer, :player_hand, :house_hand, :line_spread, :cash_pot, :hand_values

  def initialize (customer)
    @customer = customer
    @player_hand = []
    @house_hand = []
    @line_spread = []
    @cash_pot = []
    @hand_values = [
      {name: 'one pair', value: 1}
      {name: 'two pair', value: 2}
      {name: 'three of a kind', value: 3}
      {name: 'straight', value: 4}
      {name: 'flush', value: 5}
      {name: 'full house', value: 6}
      {name: 'four of a kind', value: 7}
      {name: 'straight flush', value: 8}
      ]
      startup_deal
  end


  def startup_deal
    puts 'WELCOME TO TEXAS HOLD EM'
    puts "========================"
    puts 'Ante is $2'
    puts 'Enter D to deal new hand'
    first_input = gets.strip.downcase
    if first_input == 'd'
      @cash_pot << #take value of 2 from user wallet array
      @user_hand << #take two random cards from deck array
      @house_hand << #take two random cards from deck array
      bet_screen
    else startup_deal
    end
  end



  #need to add in a block if user tries to bet more than in their wallet
  def bet_screen
    puts 'Current cash pot = $' @cashpot.total x 2
    puts 'Your hand:'
    print @player_hand
    puts 'Line spread:'
    print @line_spread
    puts 'Would you like to make a bet? Press Y or N'
    bet_ask = gets.strip.downcase
    if bet_ask == 'y'
      puts 'Enter bet dollar amount'
      bet_amt = input.strip.to_f
      #evaluate @house_hand to see if it should match or fold
      if yes
        puts 'Casino has decided to match your bet'
        @cash_pot << bet_amts << #from user wallet array
      else no
        puts 'Casino has folded.'
        you_win
      end
    elsif bet_ask == 'n'
      deal_next
    else
      bet_screen
    end
  end



  def deal_next
    if @line_spread.length == 0
      @line_spread << #take three random cards from the deck array
      puts 'The line deal is:'
      print @line_spread
      bet_screen
    elsif @line_spread.length == 5
      hand_eval
    else
      @line_spread << #take one random card from the deck array
      puts 'The next line card is:'
      puts @line_spread.last
      bet_screen
    end
  end



  def you_lose
    puts 'You lose!'
    puts @cash_pot.total x 2
    puts 'Has been entered into Lot Lizard Casinos already filthy rich coffers'
    puts 'Press P to play again or any key to exit'
    play_again = gets.strip.downcase
    if play_again == 'p'
      startup_deal
    else
      exit
    end
  end


  def you_win
    'You win!'
    puts 'The cash pot winnings of:'
    puts @cash_pot.value.total x 2
    puts 'Has been added to your wallet.'
    #double the value of the cash pot array and deposit to user wallet array
    puts 'Press P to play again or any key to exit'
    play_again = gets.strip.downcase
    if play_again == 'p'
      startup_deal
    else
      exit
    end
  end


  #need to combine the hand with the line array first

  def hand_eval
    if array has 5 inputs with the same suit
      run eval_for_straight
      if yes
        hand_value = 8 (royal flush)
      else
        hand_value = 5 (flush)
      end
    elsif 4 array values all equal eachother?
      hand_value = 7 (4 of a kind)
    elsif run eval_for_straight
      if yes
        hand_value = 4 (straight)
      end
    elsif 3 array values all equal eachother?
      if the remaining array values have a pair?
        hand value = 6
      else
        hand value = 3
      end
    elsif 2 array values all equal eachother?
      if the remaining array values have a pair?
        hand value = 2
      else
        hand value = 1
      end
    elsif
      hand value = 0
    end
  end



  def final_comparison
    if user hand value > than house hand value
      you_win
    elsif
      house hand value > user hand value
      you_lose
    else
      compares hands (i.e. which pair is higher)
    end

  end



  def eval_for_straight

  end



  def house_match_or_fold
    hand_eval
    if @house_hand.length + @line_spread.length = 0



  end


end
