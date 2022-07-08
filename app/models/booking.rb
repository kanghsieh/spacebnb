class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :planet
  belongs_to :spaceship
end
