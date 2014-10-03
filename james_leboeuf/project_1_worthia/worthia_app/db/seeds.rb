User.destroy_all
Item.destroy_all

u1 = User.create(:name => 'james')
u2 = User.create(:name => 'lawrence')

i1 = Item.create(:name => 'apple')
i2 = Item.create(:name => 'hammock')

