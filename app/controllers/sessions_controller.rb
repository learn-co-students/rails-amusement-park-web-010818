class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:message] = "User not found or password didn't match"
      redirect_to signin_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
