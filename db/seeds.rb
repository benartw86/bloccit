require 'random_data'

# create users

5.times do 
  User.create!(
  
  name: RandomData.random_name,
  email: RandomData.random_email,
  password: RandomData.random_sentence
  
  )
end
users = User.all

#create topics

15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all

50.times do
# create posts

  Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: RandomData.random_sentence,      #RandomData will create random stings for text and body
    body: RandomData.random_paragraph
)

end

posts = Post.all

# create comments

50.times do

  Comment.create!(    #using the "!" (bang) instructs method to raise an error if there is a problem
    user: users.sample,
    post: posts.sample,                #sample returns a random element from the array, in order to pick a random post for each comment
    body: RandomData.random_paragraph
)

end

#Create an admin user

admin = User.create!(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
)

member = User.create!(
  name: 'Member User',
  email: 'member@example.com',
  password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
