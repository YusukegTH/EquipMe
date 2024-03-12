# Clear existing data
Booking.destroy_all
User.destroy_all
Item.destroy_all

10.times do |i|
  user_attributes = {
    first_name: "first_name #{i + 1}",
    last_name: "last_name #{i + 1}",
    phone_number: "phone_number #{i + 1}",
    email: "email_#{i + 1}@gmail.com",
    password: "password#{i + 1}"
  }
  user = User.new(user_attributes)
  user.save

  10.times do |j|
    item_attributes = {
      name: "Item #{j + 1}",
      category: "Category #{j + 1}",
      price: rand(50..200),
      availability: [true, false].sample,
      address: "Address #{j + 1}",
      description: "Description #{j + 1}",
      user: user
    }

    item = Item.new(item_attributes)
    item.save

    booking_attributes = {
      user: user,
      item: item,
    }

    Booking.create(booking_attributes)
    puts Booking.last

  end
end
