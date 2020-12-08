class AdminUsersController < ApplicationController
  before_action :redirect_if_not_admin, only: [:new, :create]

  def index
    @customers = Customer.all
  end

  def new
    @admin = AdminUser.new
  end

  def create
    @admin =  AdminUser.new(admin_params)
    if @admin.save
      redirect_to(admin_login_path)
    else
      render "new"
    end
  end

  private
  def admin_params
    params.require(:admin_user).permit(:email, :password, :password_confirmation)
  end
end
