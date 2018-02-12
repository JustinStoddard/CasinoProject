require_relative 'player'
require_relative 'slots'
#require_relative 'high_low'

class Casino
  attr_reader :player

  def initialize
    @player = Player.new
  end

  def menu
    puts "===DPL CASINO==="
    puts "Select a game"
    puts "1) Slots"
    puts "2) High Low"
    puts "3) Black Jack"
    puts "4) Leave Casino"
    enter_game(gets.to_i)
  end

  def enter_game(choice)
    case choice
      when 1
        Slot.new(@player, self)
      when 2
        puts "High Low under construction"
      when 3
        puts "Black Jack under construction"
      when 4
        puts "Goodbye"
        exit
      else
        puts "Invalid Choice"
        menu
    end
  end
end

casino = Casino.new
casino.menu