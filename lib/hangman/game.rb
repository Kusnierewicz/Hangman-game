module Hangman
  class Game
  	attr_reader :players, :pass, :round, :save

  	def initialize(player, pass = Password.new, save = Save.new)
  	  @player = player
  	  @pass = pass
      $round = 0
      @letter_base = ('a'..'z').to_a
      @save = save
  	end

  	def game_over
      return "#{@player.name} was able to decipher the password and has won the game!!!" if winner?
      return "#{@player.name} was able to guess full password and has won the game!!!" if @full_pass
      return "#{@player.name} did not decipher the pass and hung..." if $round == 12
      false
    end

    def winner?
      return pass.check_result
    end

  	def next_round
  	  puts "You have #{12 - $round} guesses left"
      $round = $round + 1
    end

    def feedback
      unless @proposal == nil
  	    @used_letters << @proposal
  	  end
  	  puts "You have already used: #{@used_letters}"
  	end

    def get_move(proposal = gets.chomp)
      @proposal = proposal
  	  pass.letter_checker(proposal)
  	end

  	def guess_full_pass(proposal = gets.chomp)
      if pass.check_full_password(proposal)
      	return @full_pass = true
      elsif 
      	$round = 12
      end
  	end

  	def options
  	  puts "would you like to save the game?(yes/no)"
  	  s = gets.chomp
  	  s == "yes" ? (puts "ok, the game is saved") : (puts "ok not yet")
  	  puts "would you like to guess full password?(yes/no)"
  	  a = gets.chomp 
  	  a == "yes" ? guess_full_pass : (puts "ok not yet")
  	end

  	#When the program first loads, add in an option that allows you 
  	#to open one of your saved games, which should jump you exactly 
  	#back to where you were when you saved. Play on!
  	#
  	#Now implement the functionality where, at the start of any turn, 
  	#instead of making a guess the player should also have the option 
  	#to save the game. Remember what you learned about serializing objects... 
  	#you can serialize your game class too!
  	
  	def play
  	  @used_letters = []

  	  puts save.list_of_games


  	  puts "start hangman"
=begin
  	  while true
        pass.print_board
        feedback
        get_move
        pass.print_board
        options
        if game_over
          puts game_over
          return
        end
        next_round      
      end
=end
  	end

  	

  end
end