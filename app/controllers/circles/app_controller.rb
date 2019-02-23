class Circles::AppController < Circles::BaseController

  def index
    @props = circle_props.merge({
      me: {
        name: current_circle_user.name,
        avatar_url: current_circle_user.avatar_url,
        is_logged_in: current_circle_user.present?, 
        is_member: current_circle_user.member? ,
        holder_limited: current_circle_user.holder_limited?,
        posts_count: current_circle_user.posts.count
      }
    })
  end
end
