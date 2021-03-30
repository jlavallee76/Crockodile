class HomeController < ApplicationController
  before_action :set_categories
  def main
    @products = Product.limit(4)
    @order_item = current_order.order_items.new
  end

  def search
    query = params[:search]
    results = Product.where("name LIKE ?", "%#{query}%")

    if params[:filter] == "Select Filter"
      @products = results
    else
      symbol = params[:filter].gsub(/ /, "_").downcase!.to_sym
      @products = results.where(symbol => true)
    end
  end

  private

  def set_categories
    @categories = Category.all.where(display: true)
  end
end
