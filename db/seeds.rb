# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Cleaning Database 🧹"
Movie.destroy_all
Bookmark.destroy_all

puts "Creating Database 🗂️"

25.times do
  Movie.create(
    title: Faker::Movie.title,
    overview: Faker::Lorem.paragraph(sentence_count: 10),
    poster_url: '../app/assets/images/movie-img.jpg',
    rating: rand(1..5)
  )
end
puts "We have a DB ✅ with #{Movie.count} movies"
