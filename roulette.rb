# numbers are 0 - 36 but 0 does not count
# numbers go "0-32-15-19-4-21-2-25-17-34-6-27-13-36-11-30-8-23-10-5-24-16-33-1-20-14-31-9-22-18-29-7-28-12-35-3-26"
# Red numbers are "1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23,25, 27, 30, 32, 34, 36"
# Black numbers are "2, 4, 6, 8, 10, 11, 13, 15, 17, 20, 22, 24, 26, 28, 29, 31, 33, 35"
# bets are: 0 - are 35:1 odds, straight up - any single number 35:1, odd or even - 2:1, red or black - 2:1
# Create win or lose functions
# Create link back to the main menu
# require_relative #'player'
# require_relative #'casino'
require_relative 'spoke'
require 'pry'
class Roulette
    attr_accessor :numbers, :wheel
        
    
    def initialize
        @numbers = []
        @wheel = []
        @wallet = 100
        generate_wheel
        bets_menu
    end
        
    def generate_wheel
        num = 0
        37.times do
        @numbers << num
        num += 1
        end
        @numbers.each do |number|
            reds = [1, 3, 5, 7, 9, 12, 14, 16, 18, 19, 21, 23,25, 27, 30, 32, 34, 36]
            color = number == 0 ? 'green' : ((reds.include?(number)) ? 'red' : 'black')
            @wheel << Spoke.new(number, color)
        end 
        shuffle
    end
    def shuffle
       @lucky = @wheel.sample
        bets_menu
    end
    def bets_menu
        puts "-----------------------------"
        puts "--------- Roulette ----------"
        puts "-----------------------------"
        puts " "
        puts "Select a game of Roulette you would like to bet on:"
        puts "1) Bet on 0"
        puts "2) Bet on Any Number"
        puts "3) Bet on an Even Number"
        puts "4) Bet on an Odd Number"
        puts "5) Bet on Black"
        puts "6) Bet on Red"
        puts "7) Go Back to Casino"
        bets_menu_choice = gets.to_i
        the_bets_menu(bets_menu_choice)
    end
    def the_bets_menu(bets_menu_choice)
            if bets_menu_choice == 1
                bet_on_zero_game
            elsif bets_menu_choice == 2
                bet_any_number_game
            elsif bets_menu_choice == 3
                bet_even_game
            elsif bets_menu_choice == 4
                bet_odd_game 
            elsif bets_menu_choice == 5
                bet_on_black
            elsif bets_menu_choice == 6
                bet_on_red
            elsif bets_menu_choice == 7
                casino_menu
            else
                "Invalid Response. Because you can't type, checkout: http://www.broderbund.com/c-33-mavis-beacon.aspx"
            end
        
    end
    def bet_on_zero_game
        puts "You have #{@wallet} in your wallet"
        puts " "
        puts "How much would you like to bet:"
        bet = gets.to_i
        if bet <= @wallet
            puts 'press any key to spin the Roulette Wheel!'
            STDIN.gets                                                                                                              
            print "            \r"
            puts "spinning"
            puts "Color:#{@lucky.color} Number:#{@lucky.number}"
            if @lucky.number == 0
               winnings = bet * 35
                @wallet += winnings
            else
                @wallet -= bet
            end
            puts "You have $#{@wallet} left. Do you want to spin again on the Bet On 0 game? Please press 'Y' or 'N'"
             leave = gets.strip.upcase
            if leave == 'Y'
                bet_on_zero_game
            elsif leave == 'N'
                bets_menu
            else
                puts "Invalid Response. Because you can't type, checkout: http://www.broderbund.com/c-33-mavis-beacon.aspx"
                bets_menu
            end
            
        else
            puts "You don't have enough money, you have @{Wallet} in your wallet, please try again."
            puts " "
            bet_on_0_game
        end
    end
    def bet_any_number_game
        puts "You have #{@wallet} in your wallet"
        puts " "
        puts "What number would you like to bet on?"
        betting_number = gets.to_i
        puts "--------------------"
        puts " "
        puts "How much would you like to bet:"
        bet = gets.to_i
        if bet <= @wallet
            puts 'press any key to spin the Roulette Wheel!'
            STDIN.gets                                                                                                              
            print "            \r"
            puts "spinning"
            puts "Color:#{@lucky.color} Number:#{@lucky.number}"
            if @lucky.number == betting_number
               winnings = bet * 35
                @wallet += winnings
            else
                @wallet -= bet
            end
            puts "You have $#{@wallet} left. Do you want to spin again on the Bet On Any Number game? Please press 'Y' or 'N'"
             leave = gets.strip.upcase
            if leave == 'Y'
                bet_any_number_game
            elsif leave == 'N'
                bets_menu
            else
                puts "Invalid Response. Because you can't type, checkout: http://www.broderbund.com/c-33-mavis-beacon.aspx"
                bets_menu
            end
            
        else
            puts "You don't have enough money, you have @{Wallet} in your wallet, please try again."
            puts " "
            bet_any_number_game
        end
    end
    def bet_even_game
        puts "You have #{@wallet} in your wallet"
        puts " "
        puts "You are betting on even numbers, how much would you like to bet?"
        bet = gets.to_i
        if bet <= @wallet
            puts 'press any key to spin the Roulette Wheel!'
            STDIN.gets                                                                                                              
            print "            \r"
            puts " "
            puts "spinning"
            puts " "
            puts "Color:#{@lucky.color} Number:#{@lucky.number}"
            if @lucky.number % 2 == 0
               winnings = bet * 2
                @wallet += winnings
            else
                @wallet -= bet
            end
            puts "You have $#{@wallet} left. Do you want to spin again on the Bet On Even Numbers game? Please press 'Y' or 'N'"
             leave = gets.strip.upcase
            if leave == 'Y'
                bet_even_game
            elsif leave == 'N'
                bets_menu
            else
                puts "Invalid Response. Because you can't type, checkout: http://www.broderbund.com/c-33-mavis-beacon.aspx"
                bets_menu
            end
            
        else
            puts "You don't have enough money, you have @{Wallet} in your wallet, please try again."
            puts " "
            bet_even_game
        end
    end
    # def bet_odd_game
    #     puts "You have #{@wallet} in your wallet"
    #     puts " "
    #    puts "How much would you like to bet:"
    #    bet = gets.to_i
    #    if bet <= @wallet
    #        puts 'press any key to spin the Roulette Wheel!'
    #        STDIN.getch                                                                                                              
    #        print "            \r"
    #        Roulette.new 
    #        if Roulette.new.number == 0
    #           winnings = bet * 35
    #            @wallet + winings
    #        else
    #            @wallet - bet
    #        end
    
    #         puts "Do you want to spin again on the Bet On Any Odd Number game? Please press 'Y' or 'N'"
    #         leave = gets.strip.upcase
    #        if leave == 'Y'
    #            bet_odd_game
    #        elsif leave == 'N'
    #            casino_menu
    #        else
    #            puts "Invalid Response. Because you can't type, checkout: http://www.broderbund.com/c-33-mavis-beacon.aspx"
    #            bets_menu
    #        end
    #    else
    #        puts "You don't have enough money, you have @{Wallet} in your wallet, please try again."
    #        puts " "
    #        bet_odd_game
    #    end
    # end
    # def bet_on_black
    #     puts "You have #{@wallet} in your wallet"
    #     puts " "
    #    puts "How much would you like to bet:"
    #    bet = gets.to_i
    #    if bet <= @wallet
    #        puts 'press any key to spin the Roulette Wheel!'
    #        STDIN.getch                                                                                                              
    #        print "            \r"
    #        Roulette.new 
    #        if Roulette.new.number == 0
    #           winnings = bet * 35
    #            @wallet + winings
    #        else
    #            @wallet - bet
    #        end
       
    #         puts "Do you want to spin again on the Bet On Any Black game? Please press 'Y' or 'N'"
    #         leave = gets.strip.upcase
    #        if leave == 'Y'
    #            bet_on_black
    #        elsif leave == 'N'
    #            casino_menu
    #        else
    #            puts "Invalid Response. Because you can't type, checkout: http://www.broderbund.com/c-33-mavis-beacon.aspx"
    #            bets_menu
    #        end
    #    else
    #        puts "You don't have enough money, you have @{Wallet} in your wallet, please try again."
    #        puts " "
    #        bet_on_black
    #    end
    # end
    # def bet_on_red
    #     puts "You have #{@wallet} in your wallet"
    #     puts " "
    #    puts "How much would you like to bet:"
    #    bet = gets.to_i
    #    if bet <= @wallet
    #        puts 'press any key to spin the Roulette Wheel!'
    #        STDIN.getch                                                                                                              
    #        print "            \r"
    #        Roulette.new 
    #        if Roulette.new.number == 0
    #           winnings = bet * 35
    #            @wallet + winings
    #        else
    #            @wallet - bet
    #        end
       
    #         puts "Do you want to spin again on the Bet On Any Red game? Please press 'Y' or 'N'"
    #         leave = gets.strip.upcase
    #        if leave == 'Y'
    #            bet_on_red
    #        elsif leave == 'N'
    #            casino_menu
    #        else
    #            puts "Invalid Response. Because you can't type, checkout: http://www.broderbund.com/c-33-mavis-beacon.aspx"
    #            bets_menu
    #        end
    #    else
    #        puts "You don't have enough money, you have @{Wallet} in your wallet, please try again."
    #        puts " "
    #        bet_on_red
    #    end
    # end
    # def casino_menu
    #     #Take me to Casino Menu
    # end
end
Roulette.new.bets_menu

