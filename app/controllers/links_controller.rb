class LinksController < ApplicationController
  before_action :set_actor

  def new
    @link = Link.new
    @imdb = Social.find_by(name: "IMDb")
    @instagram = Social.find_by(name: "Instagram")
    @youtube = Social.find_by(name: "Youtube")
  end

  def create
    raise
  end

  def update
  end

  def destroy
  end

  private

  def set_actor
    full_name = params[:actor_name].split("-")
    @actor = Actor.find_by(first_name: full_name.first, last_name: full_name.last)
  end
end
