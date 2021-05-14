# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name postcode address introduction])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name postcode address introduction])
  end

  private

  def after_sign_up_path_for(resource)
    books_path
  end

  def after_sign_out_path_for(resource)
    new_user_registration_path
  end
end
