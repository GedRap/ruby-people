autoload(:Person, "./Person.rb")
autoload(:Runner, "./Runner.rb")
autoload(:PersonRepository, "./PersonRepository.rb")

repository = PersonRepository.new

runner = Runner.new repository

puts "### PeopleCom v1.0"
puts "### Type help for assistance"

print ">>> "
STDOUT.flush

cmd = gets.chomp

until cmd == "quit" or cmd == "exit" do
	runner.exec(cmd)

	print ">>> "
	STDOUT.flush

	cmd = gets.chomp
end

exit