# This is the User Interface
require_relative 'customer'
require_relative 'dice_game'
require_relative 'roulette'
require_relative 'spoke'
require 'pry'



class Casino
attr_accessor :customer

    def initialize
        puts "What is your name?"
        name = gets.strip
        puts "How much money did you bring?"
        wallet = gets.strip.to_i
        @customer = Customer.new(name, wallet)
        casino_menu
    end

    def casino_menu
        puts "=== Lot Lizard Casino ==="
        puts "Welcome, #{@customer.name}! $#{@customer.wallet}"
        puts "==== Gambling Floors ===="
        puts "1) High Low"
        puts "2) Roulette"
        puts "3) Dice"
        puts "4) Black Jack (Under Construction)"
        puts "5) Poker (Under Constuction)"
        puts "6) Exit Casino"
        choice = gets.strip.to_i

        case choice
            when 1
            when 2
                Roulette.new(@customer)
                casino_menu
            when 3
                Dice.new(@customer)
                casino_menu
            when 4
            when 5
            when 6
                exit_menu
            else
                puts "Invaild Input"
        end
    end

    def exit_menu
        puts "===== Goodbye! ====="
        exit
    end
end

Casino.new