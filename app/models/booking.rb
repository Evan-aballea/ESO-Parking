class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :parking
  validates :booking_start, :booking_end, presence: true
end
