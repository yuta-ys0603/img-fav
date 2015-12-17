class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def login?
    if !session.has_key? :user_id
      return redirect_to sessions_login_path
    end
    user = User.find_by(id: session[:user_id])
    if user.nil?
      return redirect_to sessions_login_path
    end
    @current_user = user
  end
end
