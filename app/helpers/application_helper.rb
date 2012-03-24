module ApplicationHelper

  def display_flash(name, msg)
    case name.to_s
    when "alert" then
      content_tag :div, msg, :class => "alert alert-warning"
    when "error" then
      content_tag :div, msg, :class => "alert alert-error"
    when "notice" then
      content_tag :div, msg, :class => "alert alert-success"
    else
      content_tag :div, msg, :class => "alert alert-info"
    end
  end

end
