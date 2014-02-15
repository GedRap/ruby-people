class Person 
	def initialize(name)
		@name = name
	end

	def introduce
		puts "Hi, I am #{@name}"
	end

	def to_s
		return " I am #{@name}"
	end
end