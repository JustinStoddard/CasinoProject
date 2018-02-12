class Slots
    attr_reader :player, :casino
  
    def initialize(player, casino)
      @player = player
      @casino = casino
    end
  
    def play_game
      puts '1) spin'
      puts '2) exit to casino'
      choice = gets.to_i
      if choice == 2
        @casino.menu
      end
    end
  
  end