module ApplicationHelper
  def error_messages(object)
   render(:partial => 'application/error_messages', :locals => {:object =>
      object})
 end

 def full_title(page_title)
  base_title = "Bank"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
 end
end
