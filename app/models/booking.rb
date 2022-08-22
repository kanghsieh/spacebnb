class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :planet
  belongs_to :spaceship

  validates :user, presence: true
  validates :spaceship, presence: true
  validates :planet, presence: true
end
