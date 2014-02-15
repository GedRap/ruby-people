class Runner

	def initialize(repository)
		@repository = repository
	end

	def exec(cmd)
		splitted = cmd.split(" ")

		if splitted.length > 1
			self.send(splitted[0], splitted[1..(splitted.length - 1)])
		else
			self.send(cmd)
		end
	end

	def missing_method(name)
		puts name + " is not implemented yet"
	end

	
	def hello(param = nil)
		if param == nil
			puts "Who are you saying hello to?"
			return
		end

		names = param.join(", ")
		puts "Hello #{names}"
	end

	def ls
		@repository.print_all
	end


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

	def remove(names)
		if names == nil or names.length == 0
			puts "You need to pass some names"
			return
		end

		names.each do |name|
			@repository.remove(name)
		end
	end

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

	def help
		puts "help -- see this message"
	end
end