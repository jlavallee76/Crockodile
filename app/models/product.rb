class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image
  has_many :order_items

  paginates_per 12

  validates :name, :price, :description, presence: true
  validates :name,
            length: { maximum: 100, too_long: "%{count} characters is the maximum allowed" }
  validates :description,
            length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
  validates :price, numericality: true, length: { maximum: 7 }
end
