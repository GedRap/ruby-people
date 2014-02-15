class Person 
	attr_accessor :name
	attr_accessor :knows

	def initialize(name)
		@name = name
		@knows = []
	end

	def meet(other_person)
		if have_met? other_person
			puts "They already know each other!"
		end

		@knows << other_person

		other_person.knows << self
	end

	def have_met?(other_person)
		return @knows.include? other_person
	end

	def print_profile
		puts "I am #{@name}"
		puts "I know #{@knows.length} other people"
		@knows.each do |other_person|
			puts "I know #{other_person.name}"
		end
	end

	def to_s
		return " I am #{@name}"
	end
end