class CartController < ApplicationController
  def show
    @order_items = current_order.order_items
  end

  def create
    # Take in a params[:id] and add that product id to the session cart
    logger.debug("Adding #{params[:id]} to the shopping cart!")
    id = params[:id].to_i
    session[:shopping_cart] << id # Pushes the id to the end of the array
    product = Product.find(id)
    flash[:notice] = "➕ Added #{product.name} to the 🛒"
    redirect_to products_path
  end

  def destroy
    # Take in a params[:id] and remove that product id from the session cart
    logger.debug("Removing #{params[:id]} from the shopping cart!")
    id = params[:id].to_i
    session[:shopping_cart].delete(id) # Deletes the id from the array
    product = Product.find(id)
    flash[:notice] = "➖ Removed #{product.name} from the 🛒"
    redirect_to root_path
  end
end
