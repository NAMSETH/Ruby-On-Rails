class AdminSessionsController < ApplicationController
  def new
    if admin_logged_in?
      redirect_to(admin_users_path)
    end
    if logged_in?
      redirect_to(root_path)
    end
  end

  def create
    admin = AdminUser.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      admin_log_in(admin)
      redirect_to(admin_users_path)
    else
      flash.now[:login_error] = "invalid email or password"
      render "new"
    end
  end

  def destroy
    admin_logout
    redirect_to(admin_login_path)
  end

end
