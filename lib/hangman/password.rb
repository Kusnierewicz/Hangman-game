module Hangman
  class Password

  	attr_reader :result

  	def initialize
  	  @result = default_board(set_pass)
  	end

	def print_board
	  puts @pass.inspect
	  #puts result.inspect
	  puts result.gsub(/\w/){|l| l + ' '}.inspect
	end

	def letter_checker(character)
	  a = (0 ... @pass.length).find_all { |i| @pass[i,1] == character }
	  a.each do |i|
	    result[i] = character
	  end
	end

	def check_result
      !@result.include? "_"
    end

    def check_full_password(proposal)
      proposal == @pass
    end

    private

    def default_board(text)
      text.gsub(/./, '_')
	end

	def set_pass
	  lines = File.readlines("5desk.txt")
	  line_count = lines.size
	  p = rand(line_count)
	  unless lines[p].length > 4 && lines[p].length < 13 
	  	p = rand(line_count)
	  end
	  @pass = lines[p].downcase.chomp
	  @pass

	end

  end
end