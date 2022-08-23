class Parking < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_many_attached :photos

  validates :address, :height, :width, :length, :description, presence: true

end
