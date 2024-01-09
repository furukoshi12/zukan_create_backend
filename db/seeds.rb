# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(
  name: "admin",
  password: "password",
  password_confirmation: "password",
  email: "admin@example.com",
  role: "admin"
  )

User.create!(
name: "general",
password: "password",
password_confirmation: "password",
email: "general@example.com",
)


Template.create(name: "白紙")

3.times do |n|
  IllustratedBook.create!(
    title: "title#{n}",
    user_id: 1,
    )
end