system('clear')

require 'pry'

require_relative './tenant.rb'
require_relative './apartment.rb'
require_relative './building.rb'

chris = Tenant.new('Chris Eccy', 23, 'm')
#puts chris

apt = Apartment.new('25b', 100, 1, 15)
#puts apt

building = Building.new('123 New Road', 'Neo-industrial', true, false, 1000)
#puts building

#Globals to store our data
$buildings = []
$tenants = []

# Seed Data
$buildings.push building
$buildings.first.apartments[apt.name] = apt
$buildings.first.apartments[apt.name].tenants << chris

$tenants.push chris

def main_menu 
	puts
  puts "Rental System"
  puts "============="
  puts "1. List all Tenants"
  puts "2. Enter new Tenant"
  puts "3. List all Apartments"
  puts "4. Enter new Apartment / Building"
  puts "5. Link Tenant to Apartment"
  puts "6. List all Buildings"
  puts "7. Enter new Building"
  puts "q. Quit"
  puts
end

def read_selection
  main_menu
  print "Enter selection: "
  gets.chomp.downcase
end

menu_option = read_selection
puts

until menu_option == 'q'
	case menu_option
	when '1'
		#list all tenants
    $tenants.each do |t|
    	puts t
    end
  when '2'
  	puts "Enter New Tenant"
  	puts "----------------"
  	print 'Enter name: '
    tenant_name = gets.chomp
    print 'Enter age: '
    tenant_age = gets.chomp
    print 'Enter gender: '
    tenant_gender = gets.chomp
    $tenants.push Tenant.new(tenant_name, tenant_age, tenant_gender)

	when '3'
		#list all buildings and apartments
		$buildings.each do |b|
			puts b
			b.apartments.each do |a|
				puts a
			end
		end
	when '4'
		# Enter new apartment
  	puts "Enter New Apartment / Building"
  	puts "------------------------------"
  	print 'Enter name: '
    apt_name = gets.chomp
    print 'Enter price: '
    apt_price = gets.chomp
    print 'Enter sqft: '
    apt_sqft = gets.chomp
    print 'Enter num bathrooms: '
    apt_bathrooms = gets.chomp    
    print 'Enter num bedrooms'
    apt_bedrooms = gets.chomp
    print 'Enter building: '

    counter = 1

    $buildings.each do |b|
   	puts "#{counter} #{b.address}"
      counter += 1 
    end
     
#    $tenants.push Tenant.new(tenant_name, tenant_age, tenant_gender) 
	end

  menu_option = read_selection
  puts
end


binding.pry
