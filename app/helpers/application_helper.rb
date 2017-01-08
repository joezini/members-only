module ApplicationHelper

  def logged_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= lookup_current_user
  end

  def lookup_current_user
    if (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user.authenticated?(cookies[:remember_token])
        user
      else
        nil
      end
    else
      nil
    end
  end

  def current_user=(user)
    log_in user
    @current_user = user
  end

end
