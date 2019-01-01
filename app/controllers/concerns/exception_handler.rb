module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    before_action :prepare_exception_notifier

    if Rails.env.development?
      # Donot rescue StandardError, use Better Errors rack middleware
    else
      rescue_from StandardError do |ex|
        logger.error ex
        # ExceptionNotifier.notify_exception(ex, env: request.env)
        render_internal_server_error
      end
    end

    rescue_from ActiveRecord::RecordNotFound do |_ex|
      render_not_found
    end

    rescue_from ActiveRecord::RecordInvalid, ActiveRecord::RecordNotSaved do |ex|
      logger.error ex
      # ExceptionNotifier.notify_exception(ex, env: request.env)
      render_unprocessable_entity(ex.message)
    end

    rescue_from ActionController::InvalidAuthenticityToken do |ex|
      if current_user.blank?
        redirect_to login_path
      else
        logger.error ex
        # ExceptionNotifier.notify_exception(ex, env: request.env)
        render_internal_server_error
      end
    end
  end

  private

  def prepare_exception_notifier
    request.env['exception_notifier.exception_data'] = {
      current_user: current_user.inspect
    }
  end
end
