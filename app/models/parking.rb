class Parking < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_many_attached :photos

  validates :address, :height, :width, :length, :description, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
