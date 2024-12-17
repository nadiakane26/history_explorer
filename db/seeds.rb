# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

users = User.all
landmarks = Landmark.all


Landmark.find_each do |landmark|
  12.times do |i|
    user = users[i % 3] # Cycles through users with IDs 1, 2, 3
    landmark.comments.create!(
      user: users.sample,
      body: Faker::Quote.famous_last_words
    )
  end
end

comments = Comment.all

# Randomly assign likes to existing comments
comments.each do |comment|
  # Randomly pick a few users to like the comment (ensure no duplicate likes for the same user)
  rand(1..5).times do
    user = users.sample
    # Prevent the user from liking the comment more than once
    unless Like.exists?(user: user, likeable: comment)
      Like.create!(user: user, likeable: comment)
    end
  end
end

# Randomly assign likes to existing landmarks
landmarks.each do |landmark|
  rand(1..5).times do
    user = users.sample
    # Ensure the user doesn't like the same landmark more than once
    unless Like.exists?(user: user, likeable: landmark)
      Like.create!(user: user, likeable: landmark)
    end
  end
end

puts "Seeding completed successfully."