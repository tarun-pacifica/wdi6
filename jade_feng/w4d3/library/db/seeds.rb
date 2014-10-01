Author.destroy_all

Author.create(:name => 'J.K. Rowling', :dob => "31 July 1965", :genre => "fantasy", :nationality => "British", :image => "http://pmcdeadline2.files.wordpress.com/2013/09/jk-rowling__130912133457.jpg")
Author.create(:name => 'Charles Dickens', :dob => "7 February 1812", :genre => "various", :nationality => "English", :image => "http://i.telegraph.co.uk/multimedia/archive/02439/charles-dickens-st_2439822b.jpg")
Author.create(:name => "Stephen Edwin King", :dob => "September 21 1947", :genre => "thriller", :nationality => "American", :image => "http://blogs.denverpost.com/books/files/2013/07/stephen_king-coming-to-boulder.jpg")

Book.destroy_all

Book.create(:title => "Harry Potter and the Philosopher's Stone", :series => "Harry Potter", :language => "English", :genre => "fantasy", :published => 1997, :image => "http://upload.wikimedia.org/wikipedia/en/6/6b/Harry_Potter_and_the_Philosopher's_Stone_Book_Cover.jpg")
Book.create(:title => "Fellowship of the Ring", :series => "Lord of the Rings", :language => "English", :genre => "fantasy", :published => 1954, :image => "http://www.saltmanz.com/pictures/albums/Cover%20Scans/Book%20Covers/Fellowship%20of%20the%20Ring.jpg")
Book.create(:title => "Lord of the Flies", :series => "none", :language => "English", :genre => "Young Adult", :published => 1954, :image => "http://g-ecx.images-amazon.com/images/G/01/ciu/0c/2a/1ee5124128a0c36b4c12c010.L.jpg")

User.destroy_all

User.create(:name => "Jade Feng", :dob => "12 December 1991", :image => 'https://fbcdn-sphotos-b-a.akamaihd.net/hphotos-ak-xap1/v/t1.0-9/1966726_10152790385673636_550276843_n.jpg?oh=926e956835b9055a22542658e0ba727f&oe=54B964B0&__gda__=1421143784_2817e7577b75a158175785c1588e8f69', :email => 'j.feng.1991@gmail.com')
User.create(:name => "Andrew Morris", :dob => '27 June 1990', :image => 'https://scontent-a-lhr.xx.fbcdn.net/hphotos-prn2/v/t1.0-9/543937_4430055904440_1167255482_n.jpg?oh=fb2b827665570fa7c5983376a010962a&oe=54C64229', :email => "mozza314@gmail.com")
User.create(:name => "Sally Smith", :dob => '1 June 1995', :image => 'http://thumbs.dreamstime.com/x/young-teenager-1046174.jpg', :email => 'girl101@gmail.com')