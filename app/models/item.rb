class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :picture

  validates :name, presence: true
end
