class Stores::ProductsController < Stores::BaseController
  skip_before_action :authenticate_user!

  def index
    @products = current_store.products.order(created_at: :desc).page(params[:page])
  end

  def show
    @product = current_store.products.find_by(number: params[:number])
  end
end
