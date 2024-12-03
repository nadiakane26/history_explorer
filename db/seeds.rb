# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Find or create a default user to associate with regions
default_user = User.find_by!(email: 'nadia.kane26@gmail.com') do |user|
    user.password = 'password'
  end
  
  # Define Minnesota regions with historical landmark descriptions
  regions_data = [
    { name: 'Northwest', description: 'Home to Itasca State Park, where the Mississippi River begins, and rich Native American history.' },
    { name: 'Central', description: 'Known for the historic town of Little Falls, birthplace of Charles Lindbergh, and many early settlements.' },
    { name: 'Northeast', description: 'Features the historic Split Rock Lighthouse on the North Shore and remnants of the iron mining industry.' },
    { name: 'Metro', description: 'Includes the Twin Cities, with landmarks like the State Capitol, Fort Snelling, and the historic Mill District.' },
    { name: 'Southeast', description: 'Notable for the historic town of Red Wing and the Mayo Clinic, founded in Rochester in the late 1800s.' },
    { name: 'Southwest', description: 'Rich in prairie history, with sites like the Pipestone National Monument, significant to Native American culture.' }
  ]
  
  # Create regions if they don't already exist and associate with the default user
  regions_data.each do |region_attrs|
    Region.find_or_create_by!(name: region_attrs[:name]) do |region|
      region.description = region_attrs[:description]
      region.user = default_user  # Associate each region with the default user
    end
  end
  