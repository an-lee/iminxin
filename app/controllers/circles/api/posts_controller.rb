class Circles::API::PostsController < Circles::BaseController
  before_action :load_post, only: [:edit, :update, :destroy]

  def index
    @posts = current_circle.posts.includes(:author, comments: :author).order(created_at: :desc).page(params[:page])
  end

  def create
    current_circle.posts.create!(post_params.merge(author: current_circle_user))
    render_ok
  end

  def show
    @post = current_circle.posts.find(params[:post_id])
  end

  def update
    @post.update! post_params
  end
  
  def destroy
    @post.destroy!
    render_ok
  end
  
  private

  def post_params
    params.require(:post).permit(:content)
  end

  def load_post
    @post = current_circle_user.posts.find(params[:id])
  end
end
