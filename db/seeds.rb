# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

categories = %w[chinese italian japanese french belgian]

15.times do
  name = Faker::Restaurant.name
  address = Faker::Address.full_address
  category = categories.sample
  phone_number = Faker::PhoneNumber.phone_number

  Restaurant.create(
    name: name,
    address: address,
    category: category,
    phone_number: phone_number,
  )
end

45.times do
  rating = (1..5).to_a.sample
  content = Faker::Lorem.paragraph(sentence_count: 2)
  id = Restaurant.all.sample.id
  Review.create(rating: rating,
                content: content,
                restaurant_id: id)
  puts "Rating: #{rating} \n Content: #{content} \n Restaurant: #{Restaurant.find(id).name}"
end
