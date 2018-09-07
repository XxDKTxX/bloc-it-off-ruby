require 'faker'

 5.times do
   
   item = Item.create!(
   title: Faker::Zelda.item,
   user_id: 0
 
   )
  end
  
  items = Item.all
  
   
   admin = User.create!(
  
   email:    'admin@example.com',
   password: 'helloworld',
   confirmed_at: true
 )
 
  puts "#{Item.count} items created"