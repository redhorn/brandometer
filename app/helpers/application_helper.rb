module ApplicationHelper

  def full_title(page_title)
    base_title = "Brand-o-meter"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def icon_label(icon, label)
    %(<i class="icon-#{icon}"></i> #{label}).html_safe
  end

end
