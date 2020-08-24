class Listing < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
end
