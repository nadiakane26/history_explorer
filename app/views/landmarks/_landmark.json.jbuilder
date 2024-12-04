json.extract! landmark, :id, :name, :description, :user_id, :region_id, :latitude, :longitude, :created_at, :updated_at
json.url landmark_url(landmark, format: :json)
