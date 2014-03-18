class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_params, if: :devise_controller?

  protected

  def configure_permitted_params
    if params[:controller] == "user"
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :gender, :email, :password, :password_confirmation) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
    elsif params[:controller] == "owner"
      devise_parameter_sanitizer.for(:sign_up) { |o| o.permit(:email, :password, :password_confirmation) }
      devise_parameter_sanitizer.for(:sign_in) { |o| o.permit(:email, :password, :remember_me) }
    elsif params[:controller] == "admin"
      devise_parameter_sanitizer.for(:sign_in) { |a| a.permit(:email, :password) }
    end
  end
end
