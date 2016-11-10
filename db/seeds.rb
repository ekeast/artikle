# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  User.create!(
  provider: "facebook",
  uid: Faker::Company.swedish_organisation_number,
  name: Faker::Name.name
  )
end

users = User.all

50.times do
  Article.create!(
    user: users.sample,
    url: Faker::Internet.url,
    score: Faker::Number.between(1, 5)
  )
end

articles = Article.all

1000.times do
  Rating.create!(
    user: users.sample,
    article: articles.sample,
    value: Faker::Number.between(1, 5)
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Article.count} articles created"
puts "#{Rating.count} ratings created"
