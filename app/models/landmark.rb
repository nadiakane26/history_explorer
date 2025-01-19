class Landmark < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  belongs_to :region
  has_many :comments, dependent: :destroy

  acts_as_votable
  has_many_attached :images, dependent: :destroy

  has_many :saves, dependent: :destroy, class_name: "Save"
  has_many :saved_by_users, through: :saves, source: :user

  def self.ransackable_attributes(auth_object = nil)
    [ "address", "created_at", "description", "id", "id_value", "latitude", "longitude", "name", "region_id", "slug", "updated_at", "user_id" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "comments", "images_attachments", "images_blobs", "region", "saved_by_users", "saves", "user", "votes_for" ]
  end
end
