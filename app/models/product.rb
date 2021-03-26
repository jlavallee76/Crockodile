class Product < ApplicationRecord
  validates :name, :price, :description, presence: true
  validates :name,
            length: { maximum: 100, too_long: "%{count} characters is the maximum allowed" }
  validates :description,
            length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
end
