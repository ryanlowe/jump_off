module ApplicationHelper
  include ClientDate
  
  def format_head_title(title)
    return SITE_NAME if title.to_s.length < 1
    h(title)+" - "+SITE_NAME
  end
  
end
