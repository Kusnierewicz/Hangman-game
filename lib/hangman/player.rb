module Hangman
  class Player

	attr_accessor :name

	def initialize
	  @name = "none"
	end

	def setup_player
	  if @name == "none"
	  	puts ">>> Hello! What's your name mate?!"
	  	@name = gets.chomp
      end
    end

  end
end
