class Item < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :bookings, dependent: :destroy
  attribute :address, :string
  has_one_attached :picture

  validates :name, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def delete_with_associations
    bookings.destroy_all
    destroy
  end
end
