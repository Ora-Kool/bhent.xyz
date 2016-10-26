class SessionsController < ApplicationController
  def new
  end
  
  def create
  	admin = Admin.find_by(email: params[:session][:email].downcase)
  	if admin && admin.authenticate(params[:session][:password])
      log_in(admin)
      flash.now[:success] = "welcome back"
      params[:session][:remember_me] == '1' ? remember(admin) : forget(admin)
      remember admin
      redirect_back_or admin
  	else
  		flash.now[:danger] = "Invalid email/password combination"
  		render 'new'
  	end
  end

  def destroy
  	log_out if logged_in?
    redirect_to root_path
  end
end
