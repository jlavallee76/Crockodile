class HomeController < ApplicationController
  def main
    @products = Product.limit(3)
  end
end
