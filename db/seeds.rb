require 'faker'

Booking.destroy_all
User.destroy_all
Item.destroy_all

def geocode_address(address)
  result = Geocoder.search(address).first
  if result
    [result.latitude, result.longitude]
  else
    [nil, nil]
  end
end

10.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )

  10.times do
    address = Faker::Address.full_address
    latitude, longitude = geocode_address(address)

    item_attributes = {
      name: Faker::Commerce.product_name,
      category: Faker::Commerce.department(max: 1, fixed_amount: true),
      price: Faker::Commerce.price(range: 50..200),
      availability: Faker::Boolean.boolean,
      address: address,
      description: Faker::Lorem.paragraph,
      user: user,
      latitude: latitude,
      longitude: longitude
    }

    item = Item.create!(item_attributes)

    item.picture.attach(io: URI.open(Faker::LoremFlickr.image(size: "300x300")), filename: 'OIP.jpg')

    booking_attributes = {
      user: user,
      item: item
    }

    booking = Booking.create!(booking_attributes)
    puts booking
  end
end

puts "Users count: #{User.count}"
puts "Items count: #{Item.count}"
puts "Bookings count: #{Booking.count}"
