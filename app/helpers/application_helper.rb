module ApplicationHelper
  def full_title(page_title)
    site_title = "SHELV"
    if page_title.empty?
      site_title
    else
      "#{site_title} | #{page_title}"
    end
  end

end
