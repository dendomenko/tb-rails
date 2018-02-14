# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url && resource.admin?
      admin_welcome_path
    else
      stored_location_for(resource) || root_path
    end
  end
end
