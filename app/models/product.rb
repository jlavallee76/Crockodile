class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image
  has_many :order_items, dependent: :restrict_with_exception

  paginates_per 12

  validates :name, :price, :description, presence: true
  validates :name,
            length: { maximum: 100, too_long: "Exceeded the maximum characters allowed" }
  validates :description,
            length: { maximum: 1000, too_long: "Exceeded the maximum characters allowed" }
  validates :price, numericality: true, length: { maximum: 7 }
end
