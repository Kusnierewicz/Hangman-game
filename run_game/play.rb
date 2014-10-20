require_relative "../lib/hangman.rb"

puts "---------------------Welcome to Hangman setup-------------------------------"

  def set_game
    
  end


  def setup_players
    puts "Hello! What's your name?!"
    p_name = gets.chomp
    p = Hangman::Player.new({name: p_name})
    p
  end

  Hangman::Game.new(setup_players).play