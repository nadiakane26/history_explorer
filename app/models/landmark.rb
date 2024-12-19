class Landmark < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  belongs_to :region
  has_many :comments, dependent: :destroy

  has_many_attached :images,  dependent: :destroy
  has_many :likes, as: :likeable,  dependent: :destroy

  has_many :saves, dependent: :destroy, class_name: "Save"
  has_many :saved_by_users, through: :saves, source: :user
end
