class Circles::LoadingMorePostsController < Circles::BaseController
  def index
    @posts = current_circle.posts.order(created_at: :desc).page(params[:page])
  end
end