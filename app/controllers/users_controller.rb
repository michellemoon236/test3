class UsersController < ApplicationController
  #signup

  def index
    @users = User.all 
  end

  def new 
    @user = User.new
  end
    
  def create
    return redirect_to(controller: 'users',
    action: 'new') if params[:user][:password] != params[:user][:password_confirmation]
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to controller: 'users', action: 'home'
  end
 
  private
 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def home
  end
end
