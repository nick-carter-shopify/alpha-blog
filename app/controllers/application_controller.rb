class ApplicationController < ActionController::Base

  # Any methods within the ApplicationController will be available to use for all controllers
  
  # Adding it as a helper method means it is available in views as well as controllers
  helper_method :current_user, :logged_in?

  def current_user
    # If current user exists return it, else find it from the DB
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # Return true if current user exists, false otherwise
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform this action"
      redirect_to login_path
    end
  end

end
