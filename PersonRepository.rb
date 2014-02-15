class PersonRepository
	def initialize
		@people = []
	end

	def add(person)
		@people << person
	end

	def remove(name)
		@people.delete_if { |person| person.name == name }
	end

	def get_by_name(name)
		found = @people.select { |person| person.name == name }

		if found.length == 1
			return found[0]
		else
			return nil
		end
	end

	def print_all
		total = @people.length
		puts "Total: #{total}"

		@people.each do |person|
			puts person.to_s
		end
	end
end