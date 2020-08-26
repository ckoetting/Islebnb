class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :message, presence: true
  validates :full_name, presence: true
  validates :age, presence: true
  validates :number_of_guests, presence: true
end
