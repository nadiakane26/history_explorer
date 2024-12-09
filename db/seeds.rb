# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Ensure the users with IDs 1, 2, and 3 exist
user_ids = [1, 2, 3]
users = User.where(id: user_ids)

# Iterate over each landmark
Landmark.find_each do |landmark|
  12.times do |i|
    user = users[i % 3] # Cycles through users with IDs 1, 2, 3
    landmark.comments.create!(
      user: user,
      body: Faker::Lorem.sentence(word_count: 10)
    )
  end
end

puts "Seeding completed successfully."
