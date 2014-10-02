Author.destroy_all
Book.destroy_all

Author.create(:name => 'J K Rowling', :gender => 'Female', :dob => '1965/07/31', :genre => 'Childrens', :image => 'http://a4.files.biography.com/image/upload/c_fill,g_face,h_300,q_80,w_300/MTE1ODA0OTcxMzcxNTYyNTA5.jpg')
Book.create(:title => 'Harry Potter and the philosophers stone', :year => '1997', :pages => '223', :genre => 'Childrens', :image => 'http://boingboing.net/assets_mt/2011/03/22/harry-potter.jpg')





# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
