class Circles::PostsController < Circles::BaseController

  def index
    @posts = current_circle_user.posts
  end
end
