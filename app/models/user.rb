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

  has_and_belongs_to_many :roles

  validates :first_name, :last_name, presence: true
  validates :username, presence: true, uniqueness: true


  private

end
