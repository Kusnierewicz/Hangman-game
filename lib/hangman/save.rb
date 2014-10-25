require "date"
require "yaml"


module Hangman
  class Save

  	
=begin
  	r - Read only. The file must exist.
	w - Create an empty file for writing.
	a - Append to a file.The file is created if it does not exist.
	r+ - Open a file for update both reading and writing. The file must exist.
	w+ - Create an empty file for both reading and writing.
	a+ - Open a file for reading and appending. The file is created if it does not exist.
=end
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


  	def list_of_games
      puts Dir.pwd
  	  @list = []
  	  Dir.foreach('saved_games/') do |item|
  	    @list << item
	  end
	  @list
	end  
	
  end
end