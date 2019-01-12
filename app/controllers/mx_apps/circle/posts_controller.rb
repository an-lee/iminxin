class MxApps::Circle::PostsController < MxApps::Circle::BaseController
  def index
    q = params[:q].to_s.strip
    q_ransack = { author_name_cont: q, author_phone_cont: q, content_cont: q }

    posts = current_circle.posts.includes(:comments).ransack(q_ransack.merge(m: 'or')).result

    @posts = posts.order(created_at: :desc).page(params[:page])
    @posts_count = posts.count
  end
end
