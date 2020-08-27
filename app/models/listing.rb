class Listing < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_many_attached :photos
  validates :title, presence: true
  validates :description, presence: true
end
