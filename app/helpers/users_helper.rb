module UsersHelper
  def flash_class_by_type(flash_type)
    case flash_type
    when 'notice' then 'warning'
    when 'alert' then 'danger'
    else 'primary'
    end
  end
end
