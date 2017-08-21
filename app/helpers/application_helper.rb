module ApplicationHelper
  def nav_link(text, path)
    options = (controller.controller_name == path.sub('/', '')) ? { class: "active" } : {}
    content_tag(:li, options) do
      link_to text, path
    end
  end
end
