class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper

  def log_in(user)
    # Do the cookies stuff here and the user's attributes in the User model
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user
  end

  def sign_out
    current_user = nil
    cookies.permanent[:remember_token] = nil
  end

end
