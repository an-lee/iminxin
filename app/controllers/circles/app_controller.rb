class Circles::AppController < Circles::BaseController

  def index
    @props = circle_props
  end
end
