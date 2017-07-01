class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_current_location, unless: :devise_controller?
  before_action :set_raven_context

  private

  def store_current_location
    store_location_for(:user, request.url)
  end

  def set_raven_context
    Raven.user_context(id: current_user&.id) if user_signed_in?
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
