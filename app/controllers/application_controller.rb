class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?, :is_admin, :current_user


  def hello
  end

  def require_admin
    redirect_to user unless is_admin
  end

  def is_admin
    current_user.admin
  end

  def logged_in?
    session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end

  def require_log_in
    redirect_to root_path unless logged_in?
  end

end
