class Admins::RegistrationsController < Devise::RegistrationsController
	before_filter :configure_permitted_params

	protected

	def configure_permitted_params
		devise_parameter_sanitizer.for(:sign_in) do |u|
			u.permit.(:email, :password)
		end
		devise_parameter_sanitizer.for(:account_update) do |u|
			u.permit(:email, :password, :password_confirmation, :current_password)
		end
	end
end