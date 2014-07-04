require 'faker'
5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save
end
users = User.all
  
5.times do
  List.create(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph
    )
end
lists = List.all

5.times do 
  Post.create(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end
posts = Post.all



puts "Seed finished"
puts "#{Post.count} posts created"