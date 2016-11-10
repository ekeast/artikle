require 'omniauth-facebook'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def require_sign_in
    unless current_user
      flash[:alert] = "You must be logged in to do that"
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  helper_method :current_user
end
