class User < ApplicationRecord
  has_many :listings
  has_many :bookings
  has_many :reviews
  validates :full_name, presence: true
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
