class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      if user.authenticate(params[:session][:password])
        # session instance method set to the id of the user
        session[:user_id] = user.id
        flash[:notice] = "Logged in successfully"
        # Redirect to the user's show page
        redirect_to user_path(user)
      else
        # Because we aren't redirecting we don't use flash[:notice]
        # Flash persists for one full HTTP request - it would stay there for the next HTTP request
        # flash.now only displays it immediatiely and it doesn't persist
        flash.now[:alert] = "Incorrect password"
        render 'new'
      end
    else
      flash.now[:alert] = "A user with this email address does not exist"
      render 'new'
    end
  end

  def destroy
    # Destroy the session by setting it to nil
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end

end