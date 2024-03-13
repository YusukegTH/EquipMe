class Item < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :bookings, dependent: :destroy
  attribute :address, :string
  has_one_attached :picture

  validates :name, presence: true

  geocode_by :location
  after_validation :geocode

  def delete_with_associations
    bookings.destroy_all
    destroy
  end
end
