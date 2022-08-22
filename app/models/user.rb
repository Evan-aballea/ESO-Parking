class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :parkings

  validates :firstname, :lastname, :email, :phone_number, :identity_card, presence: true
  validates :identity_card, :email, uniqueness: true
end
