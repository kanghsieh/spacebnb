require 'faker'

puts "delete planets, bookings, users, spaceships..."

Booking.destroy_all
User.destroy_all
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
8.times do
  @planet = Planet.create(
    {
      name: Faker::Space.planet,
      distance: rand(1_000_000..1_000_000_000)
    }
  )
  @planet.save
end
puts "creating spaceships"
3.times do
  @spaceship = Spaceship.create(
    {
      name: Faker::Space.launch_vehicle,
      manufacturer: Faker::Space.company
    }
  )
  @spaceship.save
end
puts "creating bookings"
8.times do
  @booking = Booking.create(
    {
      user: User.first,
      spaceship: Spaceship.all.sample,
      planet: Planet.all.sample
    }
  )
  @booking.save
end

puts "seed finished"
