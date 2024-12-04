# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
user = User.find_by(email: "nadia.kane26@gmail.com")  # Find an existing user (or create a new one)


# Define regions to create or find
regions = ["Central", "Metro", "West", "Southwest"]

# Ensure each region exists
regions.each do |region_name|
  Region.find_by(name: region_name)
end

# Landmark data with associated region names
landmarks = [
  { name: "Barberg-Selvälä-Salmonson Sauna, Cokato", address: "2001 County Rd 3 SW, Cokato, MN 55321", region_name: "Central" },
  { name: "St. Bonifacius Missile Battery", address: "8822 Wildwood Ave, St Bonifacius, MN 55375", region_name: "Metro" },
  { name: "LeDuc Historic Estate", address: "1629 Vermillion St, Hastings, MN 55033", region_name: "Metro" },
  { name: "Fergus Falls Historic State Hospital", address: "Cottage Dr, Fergus Falls, MN 56537", region_name: "Northwest" },
  { name: "Lake Benton Opera House", address: "118 E Benton St, Lake Benton, MN 56149", region_name: "Southwest" }
]

# Create each landmark linked to the appropriate region
landmarks.each do |landmark_data|
  region = Region.find_by(name: landmark_data[:region_name])
  if region
    user.landmarks.create!(
      name: landmark_data[:name],
      address: landmark_data[:address],
      region: region 
    )
  else
    puts "Region #{landmark_data[:region_name]} not found!"
  end
end