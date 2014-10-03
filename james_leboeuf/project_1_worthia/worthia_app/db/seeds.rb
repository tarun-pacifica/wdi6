User.destroy_all
Item.destroy_all

u1 = User.create(:name => 'James')
u2 = User.create(:name => 'Lawrence')

i1 = Item.create(:name => 'Apple')
i2 = Item.create(:name => 'Hammock')

