module Hangman
  class Player
	attr_reader :role, :name
	def initialize(input)
	  @role = input.fetch(:role)
	  @name = input.fetch(:name)
	end
  end
end
