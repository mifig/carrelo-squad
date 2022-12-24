class LinksController < ApplicationController
  before_action :set_actor, only: [:new, :create, :update]
  before_action :set_link, only: [:update, :destroy]

  def new
    @link = Link.new
    @links = @actor.links.where(video: false)
    @videos = @actor.links.where(video: true)
  end

  def create
    @link = Link.new(link_params)
    @link.actor = @actor

    if @link.save
      redirect_to actor_links_path(@actor)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @link.update(link_params)
      redirect_to actor_link_path(@actor)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @link.destroy
    
    redirect_to actor_link_path(@link.actor, @link), status: :see_other
  end

  private

  def set_link
    @link = Link.find(params[:id])
  end

  def set_actor
    full_name = params[:actor_name].split("-")
    @actor = Actor.find_by(first_name: full_name.first, last_name: full_name.last)
  end

  def link_params
    params.require(:link).permit(:url, :social_id, :video)
  end
end
