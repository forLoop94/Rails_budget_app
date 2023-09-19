# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: "Charles")
User.create(name: "Emem")
User.create(name: "Esther")

Category.create(name: "books", icon: "books icon", user_id: 89)
Category.create(name: "music", icon: "music icon", user_id: 91)

Activity.create(name: "horror", amount: 34, author_id: 89)
Activity.create(name: "fiction", amount: 24, author_id: 89)

Activity.create(name: "hip hop", amount: 12, author_id: 91)
Activity.create(name: "gospel", amount: 5, author_id: 91)

CategoryActivity.create(category_id: 3, activity_id: 55)
CategoryActivity.create(category_id: 3, activity_id: 56)
CategoryActivity.create(category_id: 4, activity_id: 57)
CategoryActivity.create(category_id: 4, activity_id: 58)