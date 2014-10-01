Author.destroy_all
Book.destroy_all

Author.create(:name => 'James LeBoeuf', :gender => "Male", :dob => '1986/09/30', :genre => 'Ruby Bugs', :image => 'http://1.bp.blogspot.com/-gojJ43bLxbM/UJ_zTy5ZuEI/AAAAAAAAJXw/zzq-hdbP5CU/s640/hulk2.jpg')
