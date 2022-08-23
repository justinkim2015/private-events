class ApplicationController < ActionController::Base
  private

  def require_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
