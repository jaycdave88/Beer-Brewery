

class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def pink
    colorize(35)
  end

  def white
    colorize(37)
  end

  def background_blue
    colorize(44)
  end
end


class Beer

	attr_accessor :name, :type, :beer_score

	def initialize(name,type,beer_score)
		@name = name
		@type = type
		@beer_score = beer_score
	end

end

class Brewery

	def initialize(name, location) 
		@beer_container = []
		@name = name
		@location = location
	end

	def remove(name)
		beer_to_delete = nil
		@beer_container.each do |beer|
			if beer.name == name
				beer_to_delete = beer
			end
		end
		@beer_container.delete(beer_to_delete)
	end

	def add(name,type,beer_score)

		@beer_container.each do |beer|
			if beer.name == name
				puts "That beer has already been added"
				return
			end
		end
		@beer_container << Beer.new(name,type,beer_score)
	end

	def list
		@beer_container.each do |beer|
			puts beer.name.red
		end
	end

	def greater_then
		# should print all beers great then beer . names
		@beer_container.each do |beer|
			if beer.beer_score >= 5
				puts beer.name
			end
		end

	end

	def average
		sum = 0
		@beer_container.each do |beer|
			sum += beer.beer_score
		end
		average = sum.to_f / @beer_container.length
		puts average
	end

end

puts "Welcome to the Brewery!"
puts "Here are some commands you should know:"
sleep(2.0)
puts "ADD".background_blue.white   
puts "LIST".background_blue.white
puts "REMOVE".background_blue.white
puts "END".background_blue.white
sleep(3.0)
puts"Now that you have seen the commands, what would you like to do?"

command = gets.chomp
goose_island = Brewery.new("Goose","Chicago")

while command != "end" 

	if command == "list" ||command ==  "LIST" ||command ==  "List"
		if goose_island.list.empty?
			puts "List is empty".green
			return
			goose_island.list
		end

	elsif command == "average"
		goose_island.average
		
	elsif command == "greater_then"
		goose_island.greater_then

	elsif command == "add" || command == "ADD" || command == "Add"

		puts "Give me a Beer Name:"
		name = gets
		puts "What type of beer is #{name}"
		type = gets.chomp
		puts "What kinda of beer score would you give it?"
		beer_score = gets.chomp.to_i

		goose_island.add(name,type,beer_score)
		
	elsif command == "remove" || command == "REMOVE" || command == "Remove"
		puts "What beer did you want to remove?"
		remove = gets 
		goose_island.remove(remove)
	end
	puts "What command would you like to do now?"
	command = gets.chomp

end

