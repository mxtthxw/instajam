class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # current_user
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, :notice => "Welcome to InstaJam, #{@user.email}!"
    else
      flash[:alert] = "Invalid email and/or password. Please try again!"
      render "new"
    end
  end

  def show
    # current_user
    @user = User.find(params[:id])
  end

  def index
    # current_user
    @users = User.all.reverse
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
