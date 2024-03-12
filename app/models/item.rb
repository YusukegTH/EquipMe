class Item < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :bookings
  attribute :address, :string
end
