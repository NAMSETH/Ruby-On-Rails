module AdminSessionsHelper
  def admin_log_in(admin_user)
    session[:admin_user_id] = admin_user.id
  end

  def current_admin
    if session[:admin_user_id]
      AdminUser.find_by(id: session[:admin_user_id])
    end
  end

  def admin_logged_in?
    !current_admin.nil?
  end

  def admin_logout
    session.delete(:admin_user_id)
    current_admin = nil
  end
end
