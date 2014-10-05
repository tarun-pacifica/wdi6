User.destroy_all
Item.destroy_all
ItemPrice.destroy_all

u1 = User.create(:name => 'james')
u2 = User.create(:name => 'lawrence')

i1 = Item.create(:name => 'apple', :content => 'This is an apple that tastes delicious')
i2 = Item.create(:name => 'hammock', :content => 'Hammocks are awesome')
i3 = Item.create(:name => 'apple sauce', :content => 'Beautiful apple sauce baby')
i4 = Item.create(:name => 'bed sheet', :content => 'I love bedsheets')
