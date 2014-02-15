class Runner
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

	def create(names)
		if names == nil or names.length == 0
			put "You need to pass some names"
			return
		end

		names.each do |name|
			new_person = Person.new(name)
			puts new_person.to_s
		end
	end

	def help
		puts "help -- see this message"
	end
end