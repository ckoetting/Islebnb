class Listing < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_many_attached :photos
  validates :title, presence: true
  validates :description, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_price,
    against: [ :title, :price ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end

