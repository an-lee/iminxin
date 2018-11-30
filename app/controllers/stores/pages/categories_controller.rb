class Stores::Pages::CategoriesController < Stores::Pages::BaseController
  skip_before_action :authenticate_user!

  def show
  end
end
