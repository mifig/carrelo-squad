class LocalesController < ApplicationController
  skip_before_action :authenticate_user!

  def set_en
    session[:locale] = :en
    redirect_to request.referer
  end

  def set_pt
    session[:locale] = :pt
    redirect_to request.referer
  end
end
