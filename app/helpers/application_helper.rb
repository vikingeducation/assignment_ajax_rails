module ApplicationHelper

  def flash_class(flash_type)
    case flash_type
    when 'success' then 'alert-success'
    when 'error', 'alert' then 'alert-danger'
    when 'notice' then 'alert-info'
    else
      flash_type.to_s
    end
  end
end
