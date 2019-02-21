class Circles::AppController < Circles::BaseController
  skip_before_action :authenticate_user!
  skip_before_action :authenticate_member!

  def index
    @props = { 
      me: { 
        is_logged_in: current_circle_user.present?, 
        is_member: current_circle_user&.member? 
      }, 
      circle: { 
        name: current_circle.name, 
        is_binded: current_circle.binded?, 
        introduction: current_circle.introduction, 
        fee_limited: current_circle.fee_limited?, 
        holder_limited: current_circle.holder_limited?, 
        fee_amount: current_circle.fee_amount, 
        avatar_url: current_circle.avatar_url,
        owner: {}
      }
    }
  end
end
