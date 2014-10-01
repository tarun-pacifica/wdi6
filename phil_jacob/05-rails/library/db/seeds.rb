# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Author.destroy_all
Book.destroy_all
 
Author.create(:name => 'Charles Hamilton', :nationality => 'British', :dob => '1876/08/08', :period => '19th century', :image => 'http://mdonovan.free.fr/rwf/fr/frank.jpg')
 
Book.create(:title => 'Billy Bunter in Brazil', :year => '1947', :isbn => '0948248734', :image => 'http://www15.brinkster.com/hiamie/greyfriars/sh/BB_in_Brazil.jpg')

