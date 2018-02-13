
require_relative 'spoke'
require 'pry'

class Roulette
    attr_accessor :numbers, :wheel, :customer
        
    def initialize(customer)
        @numbers = []
        @wheel = []
        @customer = customer
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
                
            else
                "Invalid Response. Because you can't type, checkout: http://www.broderbund.com/c-33-mavis-beacon.aspx"
            end
        
    end

    def bet_on_zero_game
        puts "You have #{@customer.wallet} in your wallet"
        puts " "
        puts "How much would you like to bet:"
        bet = gets.to_i
        if bet <= @customer.wallet
            puts 'press any key to spin the Roulette Wheel!'
            STDIN.gets                                                                                                              
            print "            \r"
            puts "spinning"
            puts "Color:#{@lucky.color} Number:#{@lucky.number}"
                if @lucky.number == 0
                winnings = bet * 35
                    @customer.wallet += winnings
                else
                    @customer.wallet -= bet
                end
                puts "You have $#{@customer.wallet} left. Do you want to spin again on the Bet On 0 game? Please press 'Y' or 'N'"
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
        puts "You have #{@customer.wallet} in your wallet"
        puts " "
        puts "What number would you like to bet on?"
        betting_number = gets.to_i
        puts "--------------------"
        puts " "
        puts "How much would you like to bet:"
        bet = gets.to_i
        if bet <= @customer.wallet
            puts 'press any key to spin the Roulette Wheel!'
            STDIN.gets                                                                                                              
            print "            \r"
            puts "spinning"
            puts "Color:#{@lucky.color} Number:#{@lucky.number}"
                if @lucky.number == betting_number
                winnings = bet * 35
                    @customer.wallet += winnings
                else
                    @customer.wallet -= bet
                end
                puts "You have $#{@customer.wallet} left. Do you want to spin again on the Bet On Any Number game? Please press 'Y' or 'N'"
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

        puts "You have #{@customer.wallet} in your wallet"
        puts " "
        puts "You are betting on even numbers, how much would you like to bet?"
        bet = gets.to_i
        if bet <= @customer.wallet
            puts 'press any key to spin the Roulette Wheel!'
            STDIN.gets                                                                                                              
            print "            \r"
            puts " "
            puts "spinning"
            puts " "
            puts "Color:#{@lucky.color} Number:#{@lucky.number}"
                if @lucky.number % 2 == 0
                winnings = bet * 2
                    @custmer.wallet += winnings
                else
                    @customer.wallet -= bet
                end
                puts "You have $#{@customer.wallet} left. Do you want to spin again on the Bet On Even Numbers game? Please press 'Y' or 'N'"
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

    def bet_odd_game

        puts "You have #{@customer.wallet} in your wallet"
        puts " "
        puts "You are betting on odd numbers, how much would you like to bet?"
        bet = gets.to_i
        if bet <= @customer.wallet
            puts 'press any key to spin the Roulette Wheel!'
            STDIN.gets                                                                                                              
            print "            \r"
            puts " "
            puts "spinning"
            puts " "
            puts "Color:#{@lucky.color} Number:#{@lucky.number}"
                if @lucky.number % 2 == 0
                    @customer.wallet -= bet
                else
                    winnings = bet * 2
                    @custmer.wallet += winnings
                end
            puts "You have $#{@customer.wallet} left. Do you want to spin again on the Bet On Odd Numbers game? Please press 'Y' or 'N'"
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
            bet_odd_game
        end
    end

    def bet_on_black
        puts "You have #{@customer.wallet} in your wallet"
        puts " "
        puts "You are betting on all black spots, how much would you like to bet?"
        bet = gets.to_i
        if bet <= @customer.wallet
            puts 'press any key to spin the Roulette Wheel!'
            STDIN.gets                                                                                                              
            print "            \r"
            puts " "
            puts "spinning"
            puts " "
            puts "Color:#{@lucky.color} Number:#{@lucky.number}"
                if @lucky.color == 'black'
                    winnings = bet * 2
                    @custmer.wallet += winnings
                else
                    @customer.wallet -= bet
                end

            puts "You have $#{@customer.wallet} left. Do you want to spin again on the Bet On Black Colors game? Please press 'Y' or 'N'"
            leave = gets.strip.upcase
                if leave == 'Y'
                    bet_on_black
                elsif leave == 'N'
                    bets_menu
                else
                    puts "Invalid Response. Because you can't type, checkout: http://www.broderbund.com/c-33-mavis-beacon.aspx"
                    bets_menu
                end
            
        else
            puts "You don't have enough money, you have #{@customer.wallet} in your wallet, please try again."
            puts " "
            bet_on_black
        end
    end

    def bet_on_red
        puts " "
        puts "You are betting on all red spots, how much would you like to bet?"
        bet = gets.to_i
        if bet <= @customer.wallet
            puts 'press any key to spin the Roulette Wheel!'
            STDIN.gets                                                                                                              
            print "            \r"
            puts " "
            puts "spinning"
            puts " "
            puts "Color:#{@lucky.color} Number:#{@lucky.number}"
                if @lucky.color == 'red'
                    winnings = bet * 2
                    @custmer.wallet += winnings
                else
                    @customer.wallet -= bet
                end
            puts "You have $#{@customer.wallet} left. Do you want to spin again on the Bet On Black Colors game? Please press 'Y' or 'N'"
                leave = gets.strip.upcase
                if leave == 'Y'
                    bet_on_red
                elsif leave == 'N'
                    bets_menu
                else
                    puts "Invalid Response. Because you can't type, checkout: http://www.broderbund.com/c-33-mavis-beacon.aspx"
                    bets_menu
                end

        else
        puts "You don't have enough money, you have #{@customer.wallet} in your wallet, please try again."
        puts " "
        bet_on_red
        end
    end
    # TODO - casino_menu
end


