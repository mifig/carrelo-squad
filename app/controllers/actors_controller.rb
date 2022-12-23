class ActorsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_actor, only: [:show]

  def index
    @actors = Actor.all.order("first_name ASC, last_name ASC")
  end

  def show
    @video_links = @actor.links.joins(:social).where("video = true and socials.name not in ('Youtube', 'Vimeo')")
    @videos = @actor.links.joins(:social).where("video = true and socials.name in ('Youtube', 'Vimeo')")
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_actor
    full_name = params[:name].split("-")
    @actor = Actor.find_by(first_name: full_name.first, last_name: full_name.last)
  end

  def actor_params
  end
end
