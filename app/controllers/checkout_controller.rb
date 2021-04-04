class CheckoutController < ApplicationController
  def create
    product = Product.find(params[:id])

    if product.nil?
      redirect_to root_path
      return
    end

    # Set Up Stripe Session
    Stripe.api_key = "sk_test_51IYDqlDtzDvLG8OQh5LIPBfyZuuDVl4GjnZum6gMcoodzS3oUIkT60WCOzDkaaN88GOhid8eJFtrdFFae9O8W6hs00DDvAoDbZ"
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url:          checkout_success_url,
      cancel_url:           checkout_cancel_url,
      line_items:           [{
        name:        product.name,
        description: product.description,
        amount:      (product.price * 100).round,
        currency:    "cad",
        quantity:    1
      }]
    )

    respond_to do |format|
      format.js
    end
  end

  def success; end

  def cancel; end
end
