require 'faker'
require 'open-uri'

puts "delete planets, bookings, users, spaceships..."

Booking.destroy_all
Message.destroy_all
Chatroom.destroy_all
User.destroy_all
Planet.destroy_all
Spaceship.destroy_all

puts "creating users"
photo = URI.open("https://i.pravatar.cc/50")
@user = User.new
@user = User.create(
  {
    first_name: "Kang",
    last_name: "Hsieh",
    email: "kang@hsieh.com",
    password: "123456"
  }
)
@user.photo.attach(io: photo, filename: "#{@user.first_name}.png", content_type: "image/png")
@user.save

photo_two = URI.open("https://i.pravatar.cc/50")
@user_two = User.new
@user_two = User.create(
  {
    first_name: "Susanne",
    last_name: "Wong",
    email: "susanne@wong.com",
    password: "123456"
  }
)
@user_two.photo.attach(io: photo_two, filename: "#{@user_two.first_name}.png", content_type: "image/png")
@user_two.save
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
30.times do
  @booking = Booking.create(
    {
      user: User.all.sample,
      spaceship: Spaceship.all.sample,
      planet: Planet.all.sample
    }
  )
  @booking.save
end

puts "creating chatroom"
@chatroom = Chatroom.create(name: "general")

puts "seed finished"
