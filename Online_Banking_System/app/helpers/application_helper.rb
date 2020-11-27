module ApplicationHelper
  def error_messages(object)
   render(:partial => 'application/error_messages', :locals => {:object =>
      object})
 end
end
