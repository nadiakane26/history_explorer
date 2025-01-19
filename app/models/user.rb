class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :landmarks, dependent: :destroy
  has_many :regions, dependent: :destroy
  has_many :comments, dependent: :destroy
  acts_as_voter
  has_many :saves, dependent: :destroy, class_name: "Save"
  has_many :saved_landmarks, through: :saves, source: :landmark

  validates :first_name, :last_name, presence: true
  validates :username, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "email", "encrypted_password", "first_name", "id", "id_value", "last_name", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at", "username", "admin" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "comments", "landmarks", "regions", "saved_landmarks", "saves", "votes" ]
  end

  private
end
