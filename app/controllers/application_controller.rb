class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  around_action :switch_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:cast_pdf, :photo, :about, :about_en, :bio, :bio_en, :mobile])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end


  def switch_locale(&action)
    locale = session[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
