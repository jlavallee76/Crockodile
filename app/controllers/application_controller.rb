class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart

  private

  def initialize_session
    # Cart is an array of product id's
    # The first time a browser is at the site, the array is set as empty
    session[:shopping_cart] ||= []
  end

  def cart
    # Active record find method can find an array of id's
    # If it's an array it will return a collection of those object from the DB
    Product.find(session[:shopping_cart])
  end
end
