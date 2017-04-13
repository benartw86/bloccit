require 'random_data'

50.times do
# create posts

  Post.create!(
    
    title: RandomData.random_sentence,      #RandomData will create random stings for text and body
    body: RandomData.random_paragraph
)

end

posts = Post.all

# create comments

100.times do

  Comment.create!(    #using the "!" (bang) instructs method to raise an error if there is a problem
      
    post: posts.sample,                 #sample returns a random element from the array, in order to pick a random post for each comment
    body: RandomData.random_paragraph
)

end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
