#This is  dice game. 
require 'colorize'
require 'pry'



class Dice 
    attr_accessor :customer

    def initialize(customer)
        @customer = customer
        dice_welcome
    end
    
    def dice_welcome
        puts "===================="
        puts "     Dice Game      "
        puts "===================="
        puts "1) Roll Dice"
        puts "2) Read Rules"
        puts "3) Exit Game"
        choice =gets.strip.to_i
        
        case choice
            when 1
                roll
            when 2 
                dice_rules
            when 3
                
            else
                puts "Invaild Input"
                dice_welcome
        end
    end

    def dice_rules
        puts "===== Rules Of Dice ====="
        puts "\tDice is an easy game to play, you play with 4 six sided dice. First you role your dice \nthen the Roll is added up into the Sum. The Sum of the Dice will distinguish \nyour prize. "
        puts "\n===== Lucky Numbers ====="
        puts "4 - 7 - 11 - 12 - 20 - 24"
        puts "====== Good Luck!! ======"
        puts "1) Roll"
        puts "2) Menu"
        choice = gets.strip.to_i

        case choice
            when 1
                roll
            when 2
                dice_welcome
            else
                puts "Invaild Input"
                dice_rules
        end
    end

    def roll
        @dice1 = rand(1..6)
        @dice2 = rand(1..6)
        @dice3 = rand(1..6)
        @dice4 = rand(1..6)
        show_dice
    end

    def show_dice
        puts "Your roll was #{@dice1} #{@dice2} #{@dice3} #{@dice4}"
        sum_of_dice
    end

    def sum_of_dice
        
        @factor = @dice1 + @dice2 + @dice3 + @dice4

        puts "Your Sum is #{@factor}"

        case @factor
            when 4 
                puts "You Win"
                puts "Your reward is $20"
                @customer.wallet += 20
            when 7
                puts "You Win"
                puts "Your reward is $15"
                @customer.wallet += 15
            when 11
                puts "You Win"
                puts "Your reward is $25"
                @customer.wallet += 25
            when 12
                puts "You Win"
                puts "Your reward is $5"
                @customer.wallet += 5
            when 20
                puts "You Win"
                puts "Your reward is $10"
                @customer.wallet += 10
            when 24
                puts "You Win"
                puts "Your reward is $30"
                @customer.wallet += 30
            else
                puts "You lose! Give Me $20!"
                @customer.wallet -= 20
        end
        bet_again
    end



    def bet_again
        puts "===================================="
        puts "You have $#{@customer.wallet} in your wallet."
        puts "===================================="
        puts "Do you want to play again?"
        puts "1) Yes"
        puts "2) No"
        choice = gets.strip.to_i

        case choice
            when 1
                if @customer.wallet > 0
                    roll
                else
                    puts "You dont have any money left!"
                    bet_again
                end
            when 2
                dice_welcome
            else 
                puts "Invaild Input"
        end
    end
end
