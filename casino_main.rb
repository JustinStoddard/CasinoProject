# poker
# blackjack
# roulette
# slots
# high low - me
require 'colorize'
require 'pry'

class High_low
attr_accessor :attempts, :bet, :num

def initialize
@attempts = 3
@bet = 0
@num = rand 10
welcome
end

def welcome
  puts "Thank you for choosing HIGH LOW!".blue
  puts "How much money do you want to bet?".green
  @bet = gets.strip.to_i
  #bet money?
  high_low
end



  def high_low
  puts "Guess a number between 1 and 10. You only have #{@attempts} attempts!".light_blue
  user_answer = gets.strip.to_i
  check_guess(user_answer)
end

  def check_guess(user_answer)
    if user_answer == @num
      puts "Yay, you guessed right!".cyan
        playAgain
    elsif
    user_answer > @num
    @attempts -= 1
    puts "Guess lower - try again! You have #{@attempts} left".red
    elsif
    user_answer < @num
    @attempts -= 1
    puts "Guess higher - try again! You have #{@attempts} left".yellow
    end
    if @attempts > 0
      high_low
    else
      puts "Sorry, you LOSE!".magenta
      playAgain
    end
  end
        def playAgain
            puts "Would you like to play again? (y/n)".cyan
            answer = gets.strip
            if answer == "n"
              puts "Ok, returning to main menu.".magenta #return to main menu
              exit
            elsif answer == "y"
              @num = rand 10
              @attempts = 3
              high_low
            else
              puts "Invalid choice!".red
              playAgain
            end
        end
end

High_low.new
