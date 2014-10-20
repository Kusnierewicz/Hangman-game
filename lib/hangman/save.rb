module Hangman
  class Save

  	def initialize()

  	end

    def save_game
      
    end

    def load_game
      
    end


  	def list_of_games
      puts Dir.pwd
  	  @list = []
  	  Dir.foreach('saved_games/') do |item|
  	    @list << item
	    end
	    @list
	  end
	
  end
end