class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in, :login, :logout

  def require_admin
    unless current_user.admin
      flash[:errors] = "You need to be an admin to access this section"
      redirect_to(boards_url)
    end
  end

  def reguire_login
    unless logged_in
      flash[:errors] = "only registered members are allowed to access this section.
Please login below or register an account with Dominion Strategy Forum Clone"
      redirect_to(new_session_url)
    end
  end

  def require_logout
    if logged_in
      redirect_to(boards_url)
    end
  end

  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def logged_in
    !!current_user
  end

  def login(user)
    user.reset_session_token
    session[:session_token] = user.session_token
  end

  def logout
    user = current_user
    user.reset_session_token
    session[:session_token] = nil
  end
end
