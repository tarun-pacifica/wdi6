

require 'pry'

require_relative './tenant.rb'
require_relative './apartment.rb'
require_relative './building.rb'

chris = Tenant.new('Chris Eccleston', 23, 'm')


apt = Apartment.new(100, 1, 15, 'Love Shack')


#Globals to store our fata

building_b = Building.new('123 Fake St', 'Gothic', true, false, 1000)


# Seed data




$buildings = []
$tenants = []

building_a = Building.new('184 Old South Head Road', 'Contemporary', 'False', 'False', 0)
building_b = Building.new('123 Fake St', 'Gothic', true, false, 1000)
$buildings << building_b << building_a


tenant_a = Tenant.new('Phil Jacob', 25, 'm')
tenant_b = Tenant.new('Andrew Keady', 27, 'm')
tenant_c = Tenant.new('Israel Stepehen', 25, 'm')

$tenants << tenant_a << tenant_b << tenant_c

$buildings << building_a
# $buildings.first.apartments[apt.name] = apt
# $buildings.first.apartments[apt.name].tenants.pushchris

def menu
  puts 
  puts "*** R-oogle - Real Estate Google ***\n\n"
  puts
  puts '1 : Add apartment'
  puts '2 : Add tenant'
  puts '3 : Show buildings'
  puts '4 : Show vacant apartments'
  puts 
  puts "q : Quit\n\n"
  print '--> '
  gets.chomp.downcase
end

def read_selection
	menu
end

menu_option = read_selection

until menu_option == 'q'
	case menu_option
		when '1' #List buildings
		$buildings.each do |b|
			puts b.to_s
			
		end
	menu_option = read_selection
	end
end
	
# 	puts "1 View Available Buildings"
# 	puts "q Quit"
# 	print "Enter your selection:"
# end

# def read_selection
# 	menu
# 	gets.chomp
# end

# user_choice = 0
# until user_choice == 'q'
# 	user_choice = read_selection
# 	if user_choice == '1'
# 		puts building
# 	else
# 	end
# end

# binding.pry