class Item < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :bookings, dependent: :destroy
  attribute :address, :string

  def delete_with_associations
    bookings.destroy_all
    destroy
  end
end
