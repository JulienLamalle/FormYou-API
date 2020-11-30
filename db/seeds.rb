User.delete_all
Room.destroy_all
Role.destroy_all
Formation.destroy_all

User.reset_pk_sequence
Room.reset_pk_sequence
Role.reset_pk_sequence
Formation.reset_pk_sequence


require 'faker'

10.times do |i|
  Role.create(name: "Role user #{i}" )
end 


10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email,
    age: rand(18..99),
    password: "azerty",
    role:  Role.all.sample
  )
  user.save
  puts "user #{user.id} created"
end



10.times do |i|
 Formation.create(title: "Super formation #{i}",  description:Faker::Lorem.words(number: 20) )
end 


10.times do |i|
  Room.create(name: "Room formation #{i}" )
end 


puts "Flibustier created"
