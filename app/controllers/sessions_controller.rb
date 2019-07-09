class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to controller: 'users', action: 'home'
  end

  def destroy
    session.delete :user_id
    redirect_to controller: 'sessions', action: 'new'
  end
end