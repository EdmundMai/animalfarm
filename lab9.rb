class Animal
	attr_accessor :name, :species, :gender, :age

	def initialize(name, age, gender, species)
	  @name = name
	  @species = species
	  @gender = gender
	  @age = age
	end

	def to_s
	  "Name: #{@name}, of #{@species} species, #{@gender} gender, #{@age} years old."
	end
end

class Person
	attr_accessor :name, :age, :gender

	def initialize(name, age, gender)
	  @name = name
	  @age = age
	  @gender = gender
	end

	def to_s
	  "Name: #{@name}, #{@gender} gender, #{@age} years old."
	end
end

class Farm
	attr_accessor :name, :animals, :owner, :capacity

	def initialize(name, capacity)
	  @name = name
	  @capacity = capacity
	  @animals = []
	end

	def set_area(length, width)
	  @capacity = length * width
	end

	def area
	  @capacity || 0
	end

	def to_s
	  "Name: #{@name}, capacity of #{@capacity} animals, currently holds #{@animals}."
	end
end

farms = {}
peeps = {}
herd = {}


puts "(f)arm, (p)erson, (a)nimal, or (q)uit"
response = gets.chomp

while response != "q"
  if response == "f"
  	puts "What is the name of the farm?"
  	farm_name = gets.chomp
  	puts "Who is the owner of this farm?"
  	puts peeps.keys.join(', ')
  	farm_owner = gets.chomp
  	puts "What is the capacity of the farm?"
  	farm_capacity = gets.chomp.to_i
  	f = Farm.new(farm_name, farm_capacity)
  	f.owner = peeps[farm_owner]
  	puts "What animals are on the farm?"
  	puts herd.keys.join(', ')
  	farm_animals = gets.chomp
  	farm_animals.split(", ").each do |animal|
  	  f.animals << herd[animal]
  	end
  	puts "Too many animals!" if f.animals.count > f.capacity 
  	farms[farm_name] = f
  	puts "Farm successfully created."
  elsif response == "p"
  	puts "What do you want to name the person?"
  	person_name = gets.chomp
  	puts "How old is this person?"
  	person_age = gets.chomp
  	puts "What is the gender of this person?"
  	person_gender = gets.chomp
  	peeps[person_name] = Person.new(person_name, person_age, person_gender)
  	puts "Person successfully added."
  elsif response == "a"
 	puts "What is the name of this animal?"
 	animal_name = gets.chomp
 	puts "What is the age of this animal?"
 	animal_age = gets.chomp
 	puts "What is the gender of this animal?"
 	animal_gender = gets.chomp
 	puts "What is the species of this animal?"
 	animal_species = gets.chomp
 	herd[animal_name] = Animal.new(animal_name, animal_age, animal_gender, animal_species)
 	puts "Animal successfully added."
  else
  	puts "Invalid input. Please try again."
  end
  puts "(f)arm, (p)erson, (a)nimal, or (q)uit"
  response = gets.chomp
end

puts "Here are my peeps"
puts peeps.values
puts "Here is my herd"
puts herd.values
puts "Here are my farms"
puts farms.values











