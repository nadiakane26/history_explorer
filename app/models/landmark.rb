class Landmark < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  belongs_to :region
  has_many :comments, dependent: :destroy

  acts_as_votable
  has_many_attached :images,  dependent: :destroy
 

  has_many :saves, dependent: :destroy, class_name: "Save"
  has_many :saved_by_users, through: :saves, source: :user
end
