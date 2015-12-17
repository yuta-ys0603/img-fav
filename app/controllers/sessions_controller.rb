# coding: utf-8
class SessionsController < ApplicationController
  before_action :login?, only: [:logout]
  def login
  end

  def authenticate
    p user_params
    user = User.find_by(name: user_params[:name])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to images_path, notice: 'ログインしました'
    else
      redirect_to sessions_login_path, alert: 'ログインに失敗しました'
    end
  end

  def logout
    @current_user = nil
    reset_session
    redirect_to images_path, notice: 'ログアウトしました'
  end
  private
  def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
