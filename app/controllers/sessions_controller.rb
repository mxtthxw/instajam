class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by_email(params[:email])
    if @user && user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, :notice => "Welcome back to InstaJam, #{@user.email}"
    else
      flash[:alert] = "Invalid email and/or password. Please try again!"
      render 'new'
    end
  end

  def destroy
  	session.clear
    redirect_to users_path
    flash[:alert] = "Bye Bye"
  end
end
