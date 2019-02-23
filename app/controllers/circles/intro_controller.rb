class Circles::IntroController < Circles::BaseController
  skip_before_action :authenticate_user!
  skip_before_action :authenticate_member!

  def index
    @props = circle_props
  end
end
