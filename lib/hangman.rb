
require 'yaml'
require_relative "hangman/version"
require_relative "hangman/player.rb"
require_relative "hangman/password.rb"
require_relative "hangman/save.rb"

module Hangman

  class Game
  	attr_accessor :round

  	def initialize
  	  @player = Player.new
  	  @password = Password.new
  	  @round = 1
  	end

  	def which_round
  	  puts "ROUND #{@round}"
  	  puts "You have #{13 - @round} guesses left"
    end

  	def next_round
      @round += 1
    end

  	def start_game
  	  puts "---------------------Welcome to Hangman #{@player.name}-------------------------------"
  	  @player.setup_player
  	  play
  	end

  	def game_over
      return "#{@player.name} was able to decipher the word and has won the game!!!" if winner?
      return "#{@player.name} was able to guess full word and has won the game!!!" if @full_pass
      return "#{@player.name} did not decipher the word and hung..." if @round == 13
      false
    end

    def winner?
      return @password.check_result
    end	

    def options
  	  puts "would you like to save the game?(yes/no)"
  	  s = gets.chomp
  	  s == "yes" ? (puts "ok, the game is saved") : (puts "ok not yet")
  	  puts "would you like to guess full password?(yes/no)"
  	  a = gets.chomp 
  	  a == "yes" ? guess_full_pass : (puts "ok not yet")
  	end

    def get_move(proposal = gets.chomp)
  	  @password.letter_checker(proposal)
  	  unless proposal == nil
  	    @password.used_letters << proposal
  	  end
  	end

  	def guess_full_pass(proposal = gets.chomp)
      if @password.check_full_password(proposal)
      	return @full_pass = true
      else 
      	@round = 13
      end
  	end

  	def load_game
  	  f = File.open('../saved_games/' + 'luc_1414188484.yml', 'r')
  	  yaml = f.read
  	  game = Game.new
	  game = YAML::load(yaml)
	  game.resume
    end

    def save_game
      time = Time.new
      f = File.open("../saved_games/#{@player.name}_#{time.to_i}.yml", "w")
      serialized_object = YAML.dump (self)
      f.puts serialized_object
      f.close
    end

  	def play
  	  puts "czy chcesz zaladowac stan gry"
  	  y = gets.chomp
  	  if y == "y"
  	  	load_game

  	  else
  	    while true
  	  	  which_round
          @password.print_board
          @password.feedback
          get_move
          @password.print_board
          next_round  
          options
          if game_over
            puts game_over
            return
          end
          save_game
              
        end
      end

  	end

  	def resume
	  puts "Welcome back #{@player.name}!"
	  play
	end

  end
end

game = Hangman::Game.new.start_game
