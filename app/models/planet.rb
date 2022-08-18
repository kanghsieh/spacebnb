class Planet < ApplicationRecord
  has_many :bookings, dependent: :destroy
end
