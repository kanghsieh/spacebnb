# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "delete planets, bookings, users, spaceships..."

User.destroy_all
Booking.destroy_all
Planet.destroy_all
Spaceship.destroy_all

puts "creating users"
@user = User.new
@user = User.create(
  {
    first_name: "Kang",
    last_name: "Hsieh",
    email: "kang@hsieh.com",
    password: "123456"
  }
)
@user.save
puts "creating planets"
@planet = Planet.create(
  {
    name: "Mars",
    distance: 12000000
  }
)
@planet.save
puts "creating spaceships"
@spaceship = Spaceship.create(
  {
    name: "Starship",
    manufacturer: "Super Heavy"
  }
)
@spaceship.save
puts "creating bookings"
@booking = Booking.create(
  {
    user: User.first,
    spaceship: Spaceship.first,
    planet: Planet.first
  }
)
@booking.save

puts "seed finished"
