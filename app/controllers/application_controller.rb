class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_login_user
  protected
  def set_login_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
    # ‚³‚«‚Éif•¶‚ð•]‰¿‚·‚é(Œã’u‚Ìif)‚»‚Ì‚ ‚Æif‘O‚ð‚â‚é@”½‘Î‚Ìunless‚à‚ ‚è
    # session‚Ìuser_id‚ðŽg‚Á‚Ä@current_user‚Éî•ñ‚ð‹l‚ß‚é
  end
  def login?
    if !session.has_key? :user_id
      return redirect_to sessions_login_path
    end
    if @current_user.nil?
      return redirect_to sessions_login_path
    end
  end
end
