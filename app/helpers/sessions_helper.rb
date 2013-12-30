module SessionsHelper
  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def logout_current_user
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def log_in(user)
    session[:session_token] = user.session_token
  end

  def require_user!
    redirect_to new_session_url unless logged_in?
  end

  def require_no_current_user!
    redirect_to root_url unless !logged_in?
  end
  
  def require_profile_and_user!
    return redirect_to new_session_url unless logged_in?
    redirect_to new_profile_url unless current_user.profile
  end
end
