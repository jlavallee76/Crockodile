class OrderItemsController < ApplicationController
  before_action :set_order
  after_action :update_cart_size

  def create
    @order_item = @order.order_items.new(order_params)
    @order.save
    session[:order_id] = @order.id

    id = order_params[:product_id].to_i
    product = Product.find(id)
    session[:shopping_cart] << id
    flash[:notice] = "➕ Added #{product.name} to the 🛒"
    redirect_back(fallback_location: root_path)
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    @order_item.update(order_params)
    @order_items = current_order.order_items
    redirect_back(fallback_location: root_path)
  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id) # Deletes the id from the array
    @order_item = @order.order_items.find(params[:id])
    flash[:notice] = "➖ Removed #{@order_item.product.name} from the 🛒"
    @order_item.destroy
    @order_items = current_order.order_items
    redirect_back(fallback_location: root_path)
  end

  private

  def order_params
    params.require(:order_item).permit(:product_id, :quantity)
  end

  def set_order
    @order = current_order
  end

  def update_cart_size
    session[:cart_size] = @order.order_items.size
  end
end
