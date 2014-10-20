module Hangman
  class Password

  	attr_reader :result

  	def initialize
  	  @result = default_board(pass_decrypt(set_pass).join)
  	end

  	def test
  	  pass_decrypt(@pass_encrypted).join
  	end

	def print_board
	  #puts test.inspect
	  #puts result.inspect
	  puts result.gsub(/\w/){|l| l + ' '}.inspect
	end

	def letter_checker(character)
	  a = (0 ... test.length).find_all { |i| test[i,1] == character }
	  a.each do |i|
	    result[i] = character
	  end
	end

	def check_result
      !@result.include? "_"
    end

    def check_full_password(proposal)
      proposal == pass_decrypt(@pass_encrypted)
    end

    private

    def default_board(text)
      text.gsub(/./, '_')
	end

	def pass_decrypt(array)
	  array.collect {|a| a.chr}
	end

	def pass_encrypt(string)
	  array = []
	  string.each_byte do |c|
	  	array << c
	  end
	  array
	end

	def set_pass
	  lines = File.readlines("5desk.txt")
	  line_count = lines.size
	  p = rand(line_count)
	  unless lines[p].length > 4 && lines[p].length < 13 
	  	p = rand(line_count)
	  end
	  pass = lines[p].downcase.chomp
	  @pass_encrypted = pass_encrypt(pass)
	  #pass.each_byte do |c|
	  #	@pass_encrypted << c
	  #end
	  #@pass_encrypted

	end

  end
end