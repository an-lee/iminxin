class Circles::API::CommentsController < Circles::BaseController
  before_action :load_post

  def create
    return if comment_params[:content].blank?
    @comment = @post.comments.create!(comment_params.merge(author: current_circle_user))
  end
  
  def destroy
    @comment = current_circle_user.comments.find(params[:id])
    @comment.destroy!
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def load_post
    @post = current_circle.posts.find(params[:post_id])
  end
end
