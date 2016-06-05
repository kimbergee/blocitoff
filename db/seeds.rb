require 'faker'

10.times do
  User.create!(
  email: Faker::Internet.email,
  username: Faker::Internet.user_name,
  password: Faker::Internet.password(8)
  )
  #user.skip.confirmation!
  #user.save
end
users = User.all

10.times do
  Item.create!(
  user: users.sample,
  name: Faker::Lorem.words(2)
  )
end
items = Item.all


puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
