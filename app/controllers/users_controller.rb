class UsersController < ApplicationController
  before_action :logged_in?, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to new_user_path
    end
  end

  def show
  end

  def edit

  end

  def update
    if current_user.update(user_params)
      redirect_to current_user
    else
      render :edit
    end
  end

  def logged_in?
    if session[:user_id] == nil || session[:user_id] != current_user.id
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

end
