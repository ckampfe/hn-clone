require 'faker'

10.times do
  User.create(username: Faker::Internet.user_name, password: Faker::Lorem.word)
end

10.times do |i|
  Post.create(user_id: i + 1, title: Faker::Company.name, link: Faker::Internet.url)
end

10.times do |i|
  user = User.find(id = i + 1)
  user.comments.create(post_id: i + 1, body: Faker::Lorem.sentence)
end
