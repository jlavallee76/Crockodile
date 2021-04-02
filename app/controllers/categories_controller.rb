class CategoriesController < InheritedResources::Base
  def show
    @products = Product.where(category_id: params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:heading, :body, :display)
  end
end
