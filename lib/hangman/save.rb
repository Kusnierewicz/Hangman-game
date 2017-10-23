require "date"
require "yaml"


module Hangman
  class Save

    def initialize
    end


=begin
 	r - Read only. The file must exist.
	w - Create an empty file for writing.
	a - Append to a file.The file is created if it does not exist.
	r+ - Open a file for update both reading and writing. The file must exist.
	w+ - Create an empty file for both reading and writing.
	a+ - Open a file for reading and appending. The file is created if it does not exist.
=end
  	def self.load_game(filename)
      #puts Dir.pwd
      #puts "../saved_games/#{filename}"
  	  f = File.open("../saved_games/#{filename}", 'r')
  	  yaml = f.read
  	  game = Game.new
	    game = YAML::load(yaml)
      sleep(1)
      puts '>>> The Game has been successfully loaded <<<'
	    game.resume_after_loading
    end

    def self.save_game(file, name)
      sleep(2.5)
      time = Time.new
      f = File.open("../saved_games/#{name}_#{time.to_i}.yml", "w")
      serialized_object = YAML.dump (file)
      f.puts serialized_object
      f.close
    end


  	def self.list_of_games
      #puts Dir.pwd
  	  @list = []
  	  Dir.foreach('../saved_games/') do |item|
  	    @list << item
	    end
	    @list.select! {|item| item =~ /\w+/}
      i = 0
	    @list.each do |x|
        i += 1
        puts "#{i}. #{x}"
      end
	  end

    def self.access_list(position)
      @list[position.to_i - 1]
    end

    def self.num_of_saves
      @list.count
    end
  end
end