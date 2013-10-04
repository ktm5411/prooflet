module ApplicationHelper
  def display_base_errors(resource)
    return '' if resource.errors.empty?
#    messages = resource.errors.full_messages.map { |msg| content_tag(:p, msg) }.join
    messages = resource.errors.full_messages.join ', '
#      <button type="button" class="close" data-dismiss="alert">&#215;</button>
    html = <<-HTML
    <div class="alert alert-error alert-block">
      #{messages}
    </div>
    HTML
    html.html_safe
  end
end
