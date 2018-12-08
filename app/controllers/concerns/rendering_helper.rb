module RenderingHelper
  extend ActiveSupport::Concern

  private

  def render_unauthorized(message = '你还未登录')
    if request.xhr?
      render json: { message: message }, status: :unauthorized
    else
      store_forwarding_path(name: :unauthorized_forwarding_path)
      redirect_to login_path
    end
  end

  def render_forbidden(message = '你无法进行该操作')
    if request.xhr?
      render json: { message: message }, status: :forbidden
    else
      render template: 'pages/err403', layout: 'pages'
    end
  end

  def render_not_found(message = '你要操作的资源未找到')
    if request.xhr?
      render json: { message: message }, status: :not_found
    else
      render template: 'pages/err404', layout: 'pages'
    end
  end

  def render_unprocessable_entity(message)
    if request.xhr?
      render json: { message: message }, status: :unprocessable_entity
    else
      render template: 'pages/err422', layout: 'pages'
    end
  end

  def render_internal_server_error(message = '服务器开小差')
    if request.xhr?
      render json: { message: message }, status: :internal_server_error
    else
      render template: 'pages/err500', layout: 'pages'
    end
  end

  def render_wx_xml(hash)
    render xml: hash.to_xml(root: 'xml', dasherize: false)
  end

  def render_turbolinks_reload
    render js: 'Turbolinks.reload()'
  end

  def render_noty_success(message)
    render js: "new Noty({ text: '#{message}', type: 'success' }).show()"
  end

  def render_noty_error(message)
    render js: "new Noty({ text: '#{message}', type: 'error' }).show()"
  end
end
