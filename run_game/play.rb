require_relative "../lib/hangman.rb"

puts "---------------------Welcome to Hangman setup-------------------------------"

  def set_game
    
  end


  def setup_players
    puts "Hello! What's your name?!"
    @p_name = gets.chomp
    p = Hangman::Player.new({name: @p_name})
    @save = Hangman::Save.new(@p_name)
    p
  end

  
  new_game = Hangman::Game.new(setup_players, @save)
  require 'yaml'
  thing = YAML.load_file('saved_games/luc_1413842212.txt')
  puts thing.inspect
  thing.play