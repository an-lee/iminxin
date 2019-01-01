class Circles::LikedPostsController < Circles::BaseController
  before_action :load_post

  def update
    return if @post.nil?

    current_circle_user.create_action(:like, target: @post) if current_circle_user.find_action(:like, target: @post).blank?
  end

  def destroy
    return if @post.nil?
    
    current_circle_user.destroy_action(:like, target: @post) if current_circle_user.find_action(:like, target: @post).present?
  end
  
  private

  def load_post
    @post = current_circle.posts.find(params[:id])
  end
end