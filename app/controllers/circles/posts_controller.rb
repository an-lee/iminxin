class Circles::PostsController < Circles::BaseController
  before_action :load_post, only: [:edit, :update, :destroy]

  def index
    @posts = current_circle.posts.order(created_at: :desc).page(params[:page])
  end

  def new
    @post = current_circle.posts.new
  end

  def create
    @post = current_circle.posts.create(post_params.merge(author: current_circle_user))
    if @post.save
      redirect_to circle_posts_path(current_circle), notice: '成功创建'
    else
      render :new
    end
  end

  def show
    @post = current_circle.posts.find(params[:post_id])
  end
  
  
  def edit
  end

  def update
    if @post.update post_params
      redirect_to circle_post_path(current_circle, @post)
    else
      render :edit
    end
  end
  
  def destroy
    @post.destroy!
    render_turbolinks_reload
  end
  

  private

  def post_params
    params.require(:circle_app_post).permit(:content)
  end

  def load_post
    @post = current_circle_user.posts.find(params[:id])
  end
end
