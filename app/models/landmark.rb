class Landmark < ApplicationRecord
  belongs_to :user
  belongs_to :region
  has_many :comments

  has_many_attached :images
end
