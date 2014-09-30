Mountain.destroy_all

Mountain.create(:name => "Everest", :elevation => 8848, :country => "Nepal-China", :continent => "Asia")
Mountain.create(:name => "K2", :elevation => 8611, :country => "Pakistan-China", :continent => "Asia")
Mountain.create(:name => "Kangchenjunga", :elevation => 8586, :country => "Nepal-India", :continent => "Asia")


Ocean.destroy_all

Ocean.create(:name=>"Arctic Ocean", :area => 15558000, :depth => 1205, :volume => 18750000)
Ocean.create(:name=>"Atlantic Ocean", :area => 85133000, :depth => 3646, :volume => 310410900)
Ocean.create(:name=>"Indian Ocean", :area => 70560000, :depth => 3741, :volume => 264000000)
