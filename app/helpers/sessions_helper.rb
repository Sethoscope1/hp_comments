module SessionsHelper
  def current_user=(user)
    @current_user = user
    session[:session_token] = user.session_token
  end
  
  def current_user
    return nil if session[:session_token].nil?
    @current_user || User.find_by_session_token(session[:session_token])
  end

  def signed_in?
    !!current_user
  end
  
  def logout_current_user!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  private  
  
  def require_logged_out
    redirect_to user_url(current_user) if signed_in?
  end
  
  def require_current_user!
    # redirect_to new_session_url unless signed_in?
  end
end