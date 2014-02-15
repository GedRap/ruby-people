##
# Translates command line arguments and executes associated actions
class Runner
	##
	# Initialize by setting a reference to PersonRepository
	def initialize(repository)
		@repository = repository
	end

	##
	# Execute command taken straight from the command line
	def exec(cmd)
		splitted = cmd.split(" ")

		if splitted.length > 1
			self.send(splitted[0], splitted[1..(splitted.length - 1)])
		else
			self.send(cmd)
		end
	end

	##
	# Hello World!
	def hello(param = nil)
		if param == nil
			puts "Who are you saying hello to?"
			return
		end

		names = param.join(", ")
		puts "Hello #{names}"
	end

	##
	# List all people
	def ls
		@repository.print_all
	end


	##
	# Show profile of people who's names are in the given array
	def profile(names)
		if names == nil or names.length == 0
			puts "You need to pass some names"
			return
		end

		names.each do |name|
			profile = @repository.get_by_name name
			if profile == nil
				puts "Can't find #{name} :("
			else
				profile.print_profile
			end
		end
	end

	##
	# Introduce two people to each other
	def introduce(names)
		if names == nil or names.length != 2
			puts "Please give me 2 names"
		end

		profile1 = @repository.get_by_name names[0]
		profile2 = @repository.get_by_name names[1]

		if profile1 == nil
			puts "Can't find #{names[0]}"
			return
		end

		if profile2 == nil
			puts "Can't find #{names[1]}"
			return
		end

		profile1.meet profile2
	end

	##
	# Remove a given person from the list of all people
	def remove(names)
		if names == nil or names.length == 0
			puts "You need to pass some names"
			return
		end

		names.each do |name|
			@repository.remove(name)
		end
	end

	##
	# Create a new profile
	def create(names)
		if names == nil or names.length == 0
			put "You need to pass some names"
			return
		end

		names.each do |name|
			new_person = Person.new(name)
			@repository.add new_person
		end
	end

	##
	# Print list of available commands
	def help
		puts "help -- see this message"
		puts "hello name -- Say hello to {name}!"
		puts "create name1 [name2] [nameN] -- create profiles with given names"
		puts "profile name1 [name2] [nameN] -- show profiles of people given"
		puts "ls -- list all people known to exist"
		puts "remove name -- remove a person given"
		puts "introduce name1 name2 -- introduce {name1} to {name2}"
	end
end