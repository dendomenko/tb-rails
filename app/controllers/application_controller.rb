# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url && resource.admin?
      admin_welcome_path
    else
      stored_location_for(resource) || root_path
    end
  end

  def set_locale
    if cookies[:trains_locale] && I18n.available_locales.include?(cookies[:trains_locale].to_sym)
      l = cookies[:trains_locale].to_sym
    else
      l = I18n.default_locale
      cookies.permanent[:trains_locale] = l
    end
    I18n.locale = l
  end
end
