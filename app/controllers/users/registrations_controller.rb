class Users::RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_params

  # def new
  # end

  # def create
  # end

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: permitted_params)
  end

  def permitted_params
    [:email,
     :username,
     :password,
     :password_confirmation,
     :consent]
  end
end
