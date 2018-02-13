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
        puts "===================================="
        puts  <<-POEM 
         88 88                        
         88 ""                        
         88                           
 ,adPPYb,88 88  ,adPPYba,  ,adPPYba,  
a8"    `Y88 88 a8"     "" a8P_____88  
8b       88 88 8b         8PP"""""""  
"8a,   ,d88 88 "8a,   ,aa "8b,   ,aa  
 `"8bbdP"Y8 88  `"Ybbd8"'  `"Ybbd8"'
                    
          POEM
        puts "===================================="
        puts "1) Roll Dice"
        puts "2) Read Rules"
        puts "3) Exit Game"
        choice =gets.strip.to_i
        
        case choice
            when 1
                bet
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
                bet
            when 2
                dice_welcome
            else
                puts "Invaild Input"
                dice_rules
        end
    end

     def bet
         puts "===================="
         puts "How much do you bet?"
         @bet = gets.strip.to_i
         roll
     end

    def roll
        @dice1 = rand(1..6)
        @dice2 = rand(1..6)
        @dice3 = rand(1..6)
        @dice4 = rand(1..6)
        show_dice
    end

    def show_dice
        puts <<-SHOW
                     _________   _________   _________   _________
                    |         | |         | |         | |         |
    Your roll was:  |    #{@dice1}    | |    #{@dice2}    | |    #{@dice3}    | |    #{@dice4}    |
                    |         | |         | |         | |         |
                     ---------   ---------   ---------   ---------
        SHOW
        sum_of_dice
    end

    def sum_of_dice
        
        @factor = @dice1 + @dice2 + @dice3 + @dice4

        puts <<-SHOW
                     __________
                    |          |
    Your Sum is:    |    #{@factor}    |
                    |          |
                     ----------
        SHOW

        case @factor
            when 4 
                puts "!!You Win!!".green
                puts "Your reward is $500"
                @customer.wallet += 500 
                @customer.wallet += @bet * 5
            when 7
                puts "!!You Win!!".green
                puts "Your reward is $150"
                @customer.wallet += 150
                @customer.wallet += @bet * 2
            when 9
                puts "!!You Win!!".green
                puts "Your reward is $30"
                @customer.wallet += 30
                @customer.wallet += @bet * 2
            when 12
                puts "!!You Win!!".green
                puts "Your reward is $15"
                @customer.wallet += 15
                @customer.wallet += @bet 
            when 14
                puts "!!You Win!!".green
                puts "Your reward is $15"
                @customer.wallet += 15
                @customer.wallet += @bet
            when 20
                puts "!!You Win!!".green
                puts "Your reward is $150"
                @customer.wallet += 150
                @customer.wallet += @bet * 2
            when 23
                puts "!!You Win!!".green
                puts "Your reward is $50"
                @customer.wallet += 50
                @customer.wallet += @bet * 3
            when 24
                puts "!!You Win!!".green
                puts "Your reward is $500"
                @customer.wallet += 500
                @customer.wallet += @bet * 5
            else
                puts "You lose! Give Me $15!".red
                @customer.wallet -= 15
                @customer.wallet -= @bet
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
                if @customer.wallet > 14
                    bet
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
