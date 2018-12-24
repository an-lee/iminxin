class Circles::HomeController < Circles::BaseController
  skip_before_action :authenticate_user!
  skip_before_action :authenticate_member!

  def index
  end
end
