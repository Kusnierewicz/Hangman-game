
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
      puts ""
  	  puts " ~~~~~~~~~~~~~~~~~~~~~ ROUND #{@round} ~~~~~~~~~~~~~~~~~~~~~~~ "
      sleep(0.5)
  	  puts ">>> You have #{13 - @round} guesses left!! Make them count!"
    end

  	def next_round
      @round += 1
    end

  	def start_game
      puts ""
  	  puts " -------------------- Welcome to Hangman ---------------------- "
      sleep(0.5)
  	  @player.setup_player
      sleep(0.5)
      print ">>> Would you like to load a saved game?(y/n) "
      sleep(0.5)
      y = gets.chomp.downcase
      if y == "y"
        loading
      else
  	    play
      end
  	end

  	def game_over
      @correct_answer = @password.print_full_password if @round == 13
      return ">>> #{@player.name} was able to decipher the password and has won the game!!!".upcase if winner?
      return ">>> #{@player.name} was able to guess full password and has won the game!!!".upcase if @full_pass
      return ">>> #{@player.name} did not decipher the password and hung... The correct answer was #{@correct_answer}".upcase if @round == 13
      false
    end

    def winner?
      return @password.check_result
    end

    def options
  	  print ">>> Would you like to save the game?(y/n) "
      sleep(0.5)
  	  s = gets.chomp.downcase
  	  s == "y" ? Save.save_game(self, @player.name) : (puts "OK, not now.")
      sleep(0.5)
  	  print ">>> Would you like to guess full password?(y/n) "
  	  a = gets.chomp.downcase
  	  a == "y" ? guess_full_pass : (puts ">>> OK, not yet...")
  	end

    def get_move
      sleep(0.5)
      print "Give it a shot! "
      proposal = gets.chomp.downcase
      until ('a'..'z').include?(proposal) && !@password.used_letters.include?(proposal)
          sleep(0.5)
          puts ""
          puts ">>> It would be best if you would choose a new letter!! "
          print ">>> Remember that you have already chosen #{@password.used_letters}!! "
          proposal = gets.chomp.downcase
      end
      sleep(0.5)
  	  @password.letter_checker(proposal.downcase)
  	  unless proposal == nil
  	    @password.used_letters << proposal
  	  end
  	end

  	def guess_full_pass(proposal = gets.chomp)
      if @password.check_full_password(proposal)
      	return @full_pass = true
      else
        @correct_answer = @password.print_full_password
      	@round = 13
      end
  	end

    def save_game
      time = Time.new
      f = File.open("../saved_games/#{@player.name}_#{time.to_i}.yml", "w")
      serialized_object = YAML.dump (self)
      f.puts serialized_object
      f.close
    end

    def loading
      puts ""
      sleep(1.5)
      puts "****************** List of saved games *********************"
      Save.list_of_games
      sleep(0.5)
      num_of_saves = Save.num_of_saves
      puts ""
      puts ">>> Choose a file by inputting its number from the list above."
      p = gets.chomp.to_i
      until p <= num_of_saves && p != 0
        sleep(0.5)
        puts ">>> Please select correct position again!"
        p = gets.chomp.to_i
      end
      Save.load_game(Save.access_list(p))
      resume_playing
    end


  	def play

  	    while true
  	  	  which_round
          sleep(0.5)
          @password.print_board
          sleep(0.5)
          #@password.feedback
          #sleep(0.5)
          get_move
          sleep(0.5)
          unless winner?
            sleep(0.5)
            @password.print_board
            sleep(0.5)
            next_round
            sleep(0.5)
            options
            sleep(0.5)
          else
            puts ""
            puts game_over
            puts ""
            sleep(2)
            resume_playing
          end
          if game_over
            puts ""
            puts game_over
            puts ""
            sleep(2)
            resume_playing
          end
        end
  	end

    def play_again
      sleep(0.5)
      print ">>> Would you like to try again?(y/n) "
      s = gets.chomp.downcase
      puts s.inspect
      s == "y" ? true : false
    end

    def resume_after_loading
      puts ""
      sleep(2)
      puts "<<<<<<<<<<<<<<<<<<<<<<< Welcome back #{@player.name}! >>>>>>>>>>>>>>>>>>>>>>>>>>"
      sleep(2)
      play
    end

  	def resume_playing
      if play_again

        puts ""
        sleep(0.5)
        puts "<<<<<<<<<<<<<<<<<<<<<<< Welcome back #{@player.name}! >>>>>>>>>>>>>>>>>>>>>>>>>>"
        @round = 1
        sleep(0.5)
        print ">>> Would you like to load a saved game?(y/n) "
        y = gets.chomp.downcasen
        if y == "y"
          sleep(0.5)
          loading
        else
          sleep(0.5)
          play
        end
      else
        puts " >> Thanks! Good luck next time! <<"
        abort
	    end
    end

  end
end

