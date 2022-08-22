class Planet < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :name, presence: true, uniqueness: true
  validates :distance, presence: true
end
