class Parking < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :address, :height, :width, :length, :description, presence: true

end
