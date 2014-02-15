autoload(:Person, "./Person.rb")

all_people = []

name = gets.chomp

until name.empty? do
	puts ">>> Got #{name}"

	name = gets.chomp
	new_person = Person.new(name)

	all_people << new_person
end

puts "Total " + all_people.length.to_s