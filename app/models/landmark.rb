class Landmark < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  belongs_to :region
  has_many :comments, dependent: :destroy

  has_many_attached :images,  dependent: :destroy
  has_many :likes, as: :likeable,  dependent: :destroy
end
