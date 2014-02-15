##
# Person entity
class Person 
	attr_accessor :name
	attr_accessor :knows

	##
	# Initialize a person by assigning him a name and creating
	# an empty list of people he has met
	def initialize(name)
		@name = name
		@knows = []
	end

	##
	# Meet another person 
	#
	# other_person - Instance of Person
	def meet(other_person)
		if have_met? other_person
			puts "They already know each other!"
		end

		@knows << other_person

		other_person.knows << self
	end

	##
	# Check if our person has met other person before
	def have_met?(other_person)
		return @knows.include? other_person
	end

	##
	# Print the person's profile
	def print_profile
		puts "I am #{@name}"
		puts "I know #{@knows.length} other people"
		@knows.each do |other_person|
			puts "I know #{other_person.name}"
		end
	end

	##
	# Say hi!
	def to_s
		return " I am #{@name}"
	end
end