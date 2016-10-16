module ApplicationHelper
  def error_messages_for(object, field=nil)
    errors = field ? object.errors[field] : object.errors.full_messages
    errors.each do |error|
      yield(error)
    end
  end


  def flash_css_class(key)
    if ['notice', 'error'].include?(key)
      key == 'notice' ? 'info' : 'danger'
    else
      key.to_s
    end
  end
end
