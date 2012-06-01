module ApplicationHelper
  def display_flash(name, msg)
    case name.to_s
    when "alert" then
      content_tag :div, (content_tag(:a, "&times;".html_safe, :class => "close", :data => { :dismiss => "alert" }) + msg.html_safe), :class => "alert alert-warning"
    when "error" then
      content_tag :div, (content_tag(:a, "&times;".html_safe, :class => "close", :data => { :dismiss => "alert" }) + msg.html_safe), :class => "alert alert-error"
    when "notice" then
      content_tag :div, (content_tag(:a, "&times;".html_safe, :class => "close", :data => { :dismiss => "alert" }) + msg.html_safe), :class => "alert alert-success"
    else
      content_tag :div, (content_tag(:a, "&times;".html_safe, :class => "close", :data => { :dismiss => "alert" }) + msg.html_safe), :class => "alert alert-info"
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "btn nested-btn add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end