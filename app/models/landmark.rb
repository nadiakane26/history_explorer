class Landmark < ApplicationRecord
  belongs_to :user
  belongs_to :region
  has_many :comments

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
