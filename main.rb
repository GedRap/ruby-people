autoload(:Person, "./Person.rb")
autoload(:Runner, "./Runner.rb")


runner = Runner.new

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