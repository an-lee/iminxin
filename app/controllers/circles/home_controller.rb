class Circles::HomeController < Circles::BaseController
  skip_before_action :authenticate_user!
  
  def index
  end
end
