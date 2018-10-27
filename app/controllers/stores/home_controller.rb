class Stores::HomeController < Stores::BaseController
  skip_before_action :authenticate_user!

  def show
    redirect_to store_products_path(current_store)
  end
end
