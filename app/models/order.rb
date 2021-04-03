class Order < ApplicationRecord
  has_many :order_items, dependent: :restrict_with_exception
  has_one :user, dependent: :restrict_with_exception
  before_save :set_subtotal

  def subtotal
    order_items.collect do |order_item|
      order_item.valid? ? order_item.unit_price * order_item.quantity : 0
    end.sum
  end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end
end
