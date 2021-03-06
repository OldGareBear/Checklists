class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :signed_in?, :current_user

  private

  def sign_in(user)
    session[:session_token] = user.reset_token!
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def signed_in?
    !!current_user
  end

  def sign_out
    current_user.reset_token!
    session[:session_token] = nil
  end

  def require_sign_in!
    redirect_to new_sessions_url unless signed_in?
  end

end
