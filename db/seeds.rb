# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

10.times do |index|
  User.create(
    name: Faker::Name.name,
    email: "email#{index}@email.com",
    password: "abcdef"
  )
end

50.times do
  Category.create(
    name: Faker::Food.dish,
    icon: Faker::Avatar.image,
    user_id: User.all.sample.id
  )
end

50.times do
  Activity.create(
    name: Faker::Food.ingredient,
    author: User.all.sample,
    amount:Faker::Number.between(from: 1, to: 100),
  )
end

50.times do
  CategoryActivity.create(
    activity: Activity.all.sample,
    category_id: Category.all.sample.id,
  )
end

puts  "#{Activity.count} activities, #{Category.count} categories, #{User.count} users and #{CategoryActivity.count} category activities were successfully created"