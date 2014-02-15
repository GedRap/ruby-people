class PersonRepository
	def initialize
		@people = []
	end

	def add(person)
		@people << person
	end

	def print_all
		total = @people.length
		puts "Total: #{total}"

		@people.each do |person|
			puts person.to_s
		end
	end
end