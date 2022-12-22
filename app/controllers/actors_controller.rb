class ActorsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_actor, only: [:show]

  def index
    @actors = Actor.all.order("first_name ASC, last_name ASC")
  end

  def show
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
