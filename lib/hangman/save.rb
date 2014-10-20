require "date"
require "yaml"


module Hangman
  class Save

  	attr_reader :player_name
=begin
  	r - Read only. The file must exist.
	w - Create an empty file for writing.
	a - Append to a file.The file is created if it does not exist.
	r+ - Open a file for update both reading and writing. The file must exist.
	w+ - Create an empty file for both reading and writing.
	a+ - Open a file for reading and appending. The file is created if it does not exist.
=end
  	def initialize(player_name)
  	  @player_name = player_name

  	end

    def save_game
      time = Time.new
      f = File.open("saved_games/#{@player_name}_#{time.to_i}.txt", "w")

	  f.write("Warning: I don't know what to do!\n")
	  f.close #=> Make sure you close the file after you open it.
    end

    def load_game
      f.read(3) #=> returns 'War' from the example earlier.
	  f.rewind #=> moves the file pointer back to the beginning of the file.
	  f.read(3) #=> returns 'War' again
	  f.rewind #=> moves the file pointer back to the beginning of the file.
	  f.seek(3)  #=> moves the file pointer to the third position in the file.
	  f.read(3) #=> returns 'nin'
	  f.rewind #=> moves the file pointer back to the beginning of the file.
	  f.readline #=> returns "Warning: some really crazy stuff just happened!\n"
	  f.rewind #=> moves the file pointer back to the beginning of the file.
	  f.read  #=> reads the entire file.
      
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