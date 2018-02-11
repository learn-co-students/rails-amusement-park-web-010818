class UsersController < ApplicationController
  before_action :require_log_in, only: [:destroy, :edit, :show]

  def index
  end

  def show
    @user = User.find(params[:id])
    @message = params[:message]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      return redirect_to new_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end



  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :tickets, :nausea, :admin, :password)
  end

end
