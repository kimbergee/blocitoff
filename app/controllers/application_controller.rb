class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :remember_me) }
  end

  def after_sign_in_path_for(resource)
    users_show_path
  end

  private

  def require_sign_in
    unless current_user
      flash[:error] = "You must be logged in to do that"
		  redirect_to new_user_session_path
    end
  end
end
