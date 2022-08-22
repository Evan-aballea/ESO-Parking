class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :parking
  validates :arrival, :depart, presence: true
end
