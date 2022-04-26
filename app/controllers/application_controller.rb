class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?

  def index
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :last_name, :email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :last_name, :email, :password, :current_password)
    end
  end
end
