module Hangman
  class Player
	attr_reader :name
	def initialize(input)
	  @name = input.fetch(:name)
	end
  end
end
