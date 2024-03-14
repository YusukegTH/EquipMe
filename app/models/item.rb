class Item < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_name_and_description,
  against: [ :name, :description ],
  using: {
    tsearch: { prefix: true }
  }

  belongs_to :user, dependent: :destroy
  has_many :bookings, dependent: :destroy
  attribute :address, :string
  has_one_attached :picture

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  attribute :latitude, :float
  attribute :longitude, :float

  def delete_with_associations
    bookings.destroy_all
    destroy
  end
end
