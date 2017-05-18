class ApplicationController < ActionController::Base
  ADMIN_IDS = [2]
  
  protect_from_forgery with: :exception
  
  helper_method :logged_in?, :current_user
  
  def current_user
    @current_user ||= session[:user_id] ? User.find(session[:user_id]) : nil
  end
  
  def logged_in?
    !!current_user
  end
  
  def redirect_logged_out
    if !logged_in?
      flash[:danger] = "You must be logged in to do that."
      redirect_to root_path
    end
  end
end
