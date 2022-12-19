# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
    build_resource({})
    resource.build_profile
    respond_with resource
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:type, :category_ids=>[], profile_attributes: %i[first_name last_name phone]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:type, :category_ids=>[], profile_attributes: %i[first_name last_name phone]])
  end
end
