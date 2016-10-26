class AdminsController < ApplicationController
  before_action :logged_in_admin, only: [:edit, :update]
  before_action :correct_administrator, only: [:edit, :update]
	def index
		
	end

	def show
		@admin = Admin.find(params[:id])
	end
  def new
  	@admin = Admin.new
  end
  def create
  	@admin = Admin.new(admin_params)
  	if @admin.save
      log_in @admin
      flash[:success] = "successfully signed up"
        redirect_to @admin
  	else
  		render 'new'
  	end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(admin_params)
      flash[:success] = "profile updated"
      redirect_to @admin
    else
      render 'edit'
    end
  end


  private
  def admin_params
  	params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end

  #comfirm a logged in administrator
  def logged_in_admin
    unless logged_in?
      flash[:danger] = "please log in."
      redirect_to login_path
    end
  end

  def correct_administrator
    @admin = Admin.find(params[:id])
    redirect_to(root_path) unless current_admin?(@admin)
  end
end
