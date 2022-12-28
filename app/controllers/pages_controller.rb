class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :about ]

  def about
    @message = Message.new
  end
end
