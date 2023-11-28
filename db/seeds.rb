# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
3.times do |n|
  User.create!(
    name: "name#{n}",
    password: "password",
    password_confirmation: "password",
    email: "#{n}@example.com"
    )
end

5.times do |n|
  IllustratedBook.create!(
    title: "title#{n}",
    user_id: 1,
    template_id: 1
    )
end
