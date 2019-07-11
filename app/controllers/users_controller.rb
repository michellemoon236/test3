class UsersController < ApplicationController
  #signup

  def index
    @users = User.all 
  end

  def new 
    @user = User.new
  end
    
  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to controller: 'users', action: 'home'
    else
      flash[:error] = @user.errors.full_messages
      render :new
    end
  end
 
  private
 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def home
  end
end
