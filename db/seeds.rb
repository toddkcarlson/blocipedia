 require 'faker'
 #require 'random_data'
 
 # Create Users
 #User.destroy_all
 2.times do
   User.create!(
   email:    Faker::Internet.email,
   password: Faker::Color.hex_color
   #role:     'standard'
   )
 end
 users = User.all

 # Create Wikis
 #Wiki.destroy_all
 5.times do
   Wiki.create!(
     user:   users.sample,   	
     title:  Faker::SiliconValley.invention,
     body:   Faker::SiliconValley.quote
   )
 end
 wikis = Wiki.all
 
 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Wiki.count} wikis created"