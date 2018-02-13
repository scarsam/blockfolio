module ApplicationHelper
  def show_errors(object, field_name)
    if object.errors.any?
      object.errors.messages[field_name].last
    end
  end
end
