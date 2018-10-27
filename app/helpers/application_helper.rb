module ApplicationHelper
  def body_class
    return format('%s-page', params[:id].tr('_', '-')) if controller_path == 'pages' && action_name == 'show'
    format('%s-%s-page', controller_path.tr('/_', '-'), action_name)
  end

  def flash_class(level)
    case level
    when 'notice', 'success' then 'alert alert-success alert-dismissible'
    when 'info' then 'alert alert-info alert-dismissible'
    when 'warning' then 'alert alert-warning alert-dismissible'
    when 'alert', 'error' then 'alert alert-danger alert-dismissible'
    end
  end

  def display_datetime(datetime, format=:long)
    datetime.nil? ? '' : I18n.localize(datetime, format: format)
  end
end
