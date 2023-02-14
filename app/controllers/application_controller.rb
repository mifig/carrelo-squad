class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  around_action :switch_locale

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end


  def switch_locale(&action)
    locale = session[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
