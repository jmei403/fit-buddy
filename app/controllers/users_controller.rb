class UsersController < ApplicationController
  def index
    redirect_if_not_logged_in
    @users = User.all
  end

  def new #signup
    redirect_if_logged_in
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "You have signed in!"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    redirect_if_not_logged_in
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
