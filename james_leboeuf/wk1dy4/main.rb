system('clear')

#require 'pry'


# def display_title
# 	system('clear')
# 	puts "Rental program"
# 	puts "--------------"
# end



require_relative './tenant.rb'
require_relative './apartment.rb'
require_relative './building.rb'


james = Tenant.new('James LeBoeuf', 27, 'male')
batman = Tenant.new('Batman', 78, 'male')
jay_z = Tenant.new('Jay Z', 40, 'male')
catwoman = Tenant.new('Catwoman', 25, 'female')


apt = Apartment.new('Unit 100', 400, 1, 1)
apt_2 = Apartment.new('Unit 23', 500, 1, 2)
apt_3 = Apartment.new('23 Suncoast', 500, 4, 2)


building = Building.new('99 Crown Street', 'Historic', false, false, 30)
building_2 = Building.new('134 Bondi Street', 'Contemporary', true, true, 40)
building_3 = Building.new('12 Eastern Street', 'New Age', false, true, 20)
building_4 = Building.new('10 Wrangler Street', 'Old School', true, true, 10)


#Global to store our data
$buildings = [] # Array that stores buildings
$tenants = [] # Array that stores all tenants
$apartments = []


#Seed data : Data to play with, Test User(s)
$buildings << building << building_2 << building_3 << building_4
$buildings[0].apartments[apt.name] = apt #[apt.name] is hash (referenced in buildings tab with @apartments = {}) with key value. In theory, could change .name to .style etc...
$buildings[1].apartments[apt_2.name] = apt_2
$buildings[2].apartments[apt_3.name] = apt_3
$buildings[0].apartments[apt.name].tenants << james
$buildings[1].apartments[apt_2.name].tenants << batman

def ask(question) # Manually takes out all the hard coding
	puts question
	gets.chomp
end

def building_list
	# List all buildings
	$buildings.each do |b|
		puts b.address
	end
end

def apartment_list
	# List all apartments
	$buildings.each do |b|
		b.apartments.each do |number, apartment|
			puts "Building at #{ b.address } contains #{ apartment.name }"
		end
	end
end

def tenants_list
	# List all tenants
	$buildings.each do |b|
		b.apartments.each do |n, a|
			a.tenants.each do |t|
				puts "#{ t } Lives in #{ n } at #{ b.address }."
			end
		end
	end
end

def add_building
 b = Building.new(ask('Address?'),ask('Style?'),ask('Has elevator?'),ask('Number of floors?') )
 $buildings << b
end

def add_tenant # Tenant takes in 3 paramenters. What happens is implicit return FROM ask.
	t = Tenant.new(ask('Name of tenant?'),ask('Age?'),ask('Gender?') )
	$tenants << t
end

def add_apartment
	a = Apartment.new(ask('Apartment Name?'),ask('Squarefeet?'),ask('Number of bathrooms?'),ask('Number of bedrooms?'),ask)
	$apartment << a
end

def menu_text
	puts "1. List all apartments"
	puts "2. List all buildings"
	puts "3. List all tenants"
	puts "4. Add new tenant"
	puts "5. Add new apartment"
	puts "6. Add new building"
	puts "q Quit "
	print "Enter your selection: " # Print shows this on screen but doesn't add new line
end

def quit_menu_program
	puts "q. Quit"
	input = gets.chomp
	exit if input == 'q'
	input
end

def read_selection
	menu_text
	gets.chomp
end

user_choice = read_selection

until user_choice == 'q'
	case user_choice
	when '1'
		apartment_list
	when '2'
		building_list
	when '3'
		tenants_list
	when '4'
		add_tenant
	when '5'
		add_apartment
	when '6'
		add_building
	end
	user_choice = read_selection
end

#binding.pry
