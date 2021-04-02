class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show search]

  # GET /products or /products.json
  def index
    @products = Product.all.order("name asc").page(params[:page])

    # This was for menu_controller, this might go in home_controller
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

  # GET /products/1 or /products/1.json
  def show
    @product = Product.where(id: params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.category = Category.find(params[:product][:category_id])
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    @product.category = Category.find(params[:product][:category_id])
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id, :dairy_free,
                                    :gluten_free, :kosher, :peanut_free, :vegan, :vegetarian,
                                    :available, :featured)
  end
end
