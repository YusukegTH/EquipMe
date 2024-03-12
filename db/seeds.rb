# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
Booking.destroy_all
User.destroy_all
Item.destroy_all

# Method to create users
def create_user(email_prefix)
  email = "#{email_prefix}@example.com"
  password = 'password'
  user = User.create(email: email, password: password)
end

# Seed users and items
10.times do |i|
  user_email_prefix = "user#{i + 1}"
  user = create_user(user_email_prefix)

  item_attributes = {
    name: "Item #{i + 1}",
    category: "Category #{i + 1}",
    price: rand(50..200),
    availability: [true, false].sample,
    address: "Address #{i + 1}",
    description: "Description #{i + 1}",
    user_email_prefix: user_email_prefix
  }

  user = User.find_by(email: "#{user_email_prefix}@example.com")
  item = user.items.create(item_attributes.except(:user_email_prefix))
end
