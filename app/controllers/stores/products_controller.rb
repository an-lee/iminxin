class Stores::ProductsController < Stores::BaseController
  def index
    @products = current_store.products.order(created_at: :desc).page(params[:page])
  end

  def show
    @product = current_store.products.find_by(number: params[:number])
  end
end
