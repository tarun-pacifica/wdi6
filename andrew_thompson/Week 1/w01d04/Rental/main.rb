require 'pry'

require_relative './tenant.rb'
require_relative './apartment.rb'
require_relative './building.rb'

chris = Tenant.new('Chris Eccleston', 23, 'male')

apt = Apartment.new('25b', 100, 1, 15)



# Globals to store our data
$buildings = []
$tenants = []

building_a = Building.new('123 Fake St', 'Neo-industrial', true, false, 1000)

$buildings << building_a

tenant_a = Tenant.new('Andrew', '32', 'male')
tenant_b = Tenant.new('Phil', '22', 'male')
tenant_c = Tenant.new('Kate', '35', 'female')

$tenants << tenant_a << tenant_b << tenant_c

# # Seed data -- populate a building with an apartment and a tenant.
# apt.tenants << chris
# building.apartments[ apt.name ] = apt
# $buildings.push building



def menu
	puts
	puts
  puts "Welcome to the Real Estate search engine"
  puts "To list all available apartments, please press 1"
  puts "Press Q to quit"
end

def read_selection
  menu
  gets.chomp.downcase
end

menu_option = read_selection

# menu_option = 0

until menu_option == 'q'
  case menu_option
  when '1'
    # List all apartments.
    $buildings.each do |b|
      print b.to_s
    end
    menu_option = read_selection 
  end
end



secondary_menu



binding.pry