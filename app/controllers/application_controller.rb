class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :login, :logout, :require_login

  def current_user
    @user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def login(user)
    session[:session_token] = user.reset_session_token!
    @user = user
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
    @user = nil
    # redirect_to '/'
  end

  def require_login
    redirect_to new_session_url unless logged_in?
  end
end
