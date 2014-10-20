module Hangman
  class Save

  	def initialize()

  	end


  	def list_of_games
  	  list = []
  	  Dir.foreach('saved_games/*.txt') do |item|
  	    list << item
	  end
	  list
	end
	
  end
end