require 'faker'
require 'open-uri'

puts "delete planets, bookings, users, spaceships..."

Booking.destroy_all
User.destroy_all
Planet.destroy_all
Spaceship.destroy_all

puts "creating users"
file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1644365606/m65osr9oba87mizlpeov.jpg")
@user = User.new
@user = User.create(
  {
    first_name: "Kang",
    last_name: "Hsieh",
    email: "kang@hsieh.com",
    password: "123456"
  }
)
@user.photo.attach(io: file, filename: "#{@user.first_name}.png", content_type: "image/png")
@user.save
puts "creating planets"
8.times do
  file = URI.open("https://i.pravatar.cc/100")
  @planet = Planet.create(
    {
      name: Faker::Space.planet,
      distance: rand(1_000_000..1_000_000_000)
    }
  )
  @planet.photos.attach(io: file, filename: "#{@planet.name}.png", content_type: "image/png")
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
20.times do
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
