##
# Manage entities of Person
class PersonRepository
	##
	# Initialize by creating an empty list of people
	def initialize
		@people = []
	end

	##
	# Add a given Person to the list of known people
	def add(person)
		@people << person
	end

	##
	# Remove a person by given name
	def remove(name)
		@people.delete_if { |person| person.name == name }
	end

	##
	# Get person's profile by giving his name
	def get_by_name(name)
		found = @people.select { |person| person.name == name }

		if found.length == 1
			return found[0]
		else
			return nil
		end
	end

	##
	# List all people in the list
	def print_all
		total = @people.length
		puts "Total: #{total}"

		@people.each do |person|
			puts person.to_s
		end
	end
end