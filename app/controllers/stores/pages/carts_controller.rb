class Stores::Pages::CartsController < Stores::Pages::BaseController
  skip_before_action :authenticate_user!

  def show
  end
end
