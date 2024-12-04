class Landmark < ApplicationRecord
  belongs_to :user
  belongs_to :region

  geocoded_by :address
  after_validation :geocode
end
