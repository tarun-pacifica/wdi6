Mountain.destroy_all

Mountain.create(:name => "Everest", :image => 'http://i.telegraph.co.uk/multimedia/archive/02575/everest-1_2575518b.jpg', :elevation => 8848, :country => "Nepal-China", :continent => "Asia")
Mountain.create(:name => "K2", :image => 'http://inspirich.com/wp-content/uploads/2013/11/14.jpg', :elevation => 8611, :country => "Pakistan-China", :continent => "Asia")
Mountain.create(:name => "Kangchenjunga", :image => 'http://www.markhorrell.com/travel/nepal/baruntse/images/kangchenjunga.jpg', :elevation => 8586, :country => "Nepal-India", :continent => "Asia")


Ocean.destroy_all

Ocean.create(:name=>"Arctic Ocean", :image => 'http://www.deepseawaters.com/image/arctic3.jpg', :area => 15558000, :depth => 1205, :volume => 18750000)
Ocean.create(:name=>"Atlantic Ocean", :image => 'http://img3.wikia.nocookie.net/__cb20100324224458/marveldatabase/images/5/57/Atlantic_Ocean.jpg', :area => 85133000, :depth => 3646, :volume => 310410900)
Ocean.create(:name=>"Indian Ocean", :image => 'https://usahitman.com/wp-content/uploads/2014/09/4849707-Ferry_Ride_on_Indian_Ocean-0.jpg',:area => 70560000, :depth => 3741, :volume => 264000000)


Wonder.destroy_all

Wonder.create(:name => 'Colossus of Rhodes', :image => 'http://resources.touropia.com/gfx/d/seven-wonders-of-the-ancient-world/colossus_of_rhodes.jpg', :country => 'Greece', :continent => 'Europe')
Wonder.create(:name => 'Great Pyramid of Giza', :image => 'http://upload.wikimedia.org/wikipedia/commons/e/e3/Kheops-Pyramid.jpg', :country => 'Egypt', :continent => "Africa")
Wonder.create(:name => 'Hanging Gardens of Babylon', :image =>'http://mugup.info/appimg/World-Architecture/Hanging%20Gardens.JPG', :country =>'Iraq', :continent => 'Asia' )
