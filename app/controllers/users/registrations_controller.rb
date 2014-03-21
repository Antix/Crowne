class Users::RegistrationsController < Devise::RegistrationsController
	before_filter :configure_permitted_params

	protected

	# added columns: :first_name, :last_name, :company_name
	def configure_permitted_params
		devise_parameter_sanitizer.for(:sign_up) do |u|
			u.permit(:first_name, :last_name, :gender, :email, :password, :password_confirmation, :image)
		end
		devise_parameter_sanitizer.for(:sign_in) do |u|
			u.permit(:email, :password, :remember_me)
		end
		devise_parameter_sanitizer.for(:account_update) do |u|
			u.permit(:first_name, :last_name, :gender, :email, :password, :password_confirmation, :current_password)
		end
	end
end