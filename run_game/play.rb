require_relative "../lib/hangman.rb"

puts "---------------------Welcome to Hangman setup file-------------------------------"
puts "Hello! How many players would be playing the game of Hangman?"

def setup_players(how_many = gets.chomp)
	if how_many == "2"
      puts "player 1 name:"
      p1_name = gets.chomp
      puts "player 1 role (Password Keeper or Password Seeker):"
      p1_role = gets.chomp
      p1 = Hangman::Player.new({role: p1_role, name: p1_name})
      puts "player 2 name:"
      p2_name = gets.chomp
      puts "player 2 role (Password Keeper or Password Seeker):"
      p2_role = gets.chomp
      p2 = Hangman::Player.new({role: p2_role, name: p2_name})
      players = [p1, p2]
    elsif how_many == "1"
      puts "player 1 name:"
      p1_name = gets.chomp
      puts "player 1 role (Password Keeper or Password Seeker):"
      p1_role = gets.chomp
      p1 = Hangman::Player.new({role: p1_role, name: p1_name})
      players = [p1]
    end
end

Mastermind::Game.new(setup_players).play