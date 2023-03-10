class ActorsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_actor, except: [:index, :new, :create, :delete_photo]

  def index
    @actors = Actor.all.order("first_name ASC, last_name ASC")
  end

  def show
    @video_links = @actor.links.joins(:social).where("video = true and socials.name not in ('Youtube', 'Vimeo')").order(order_id: :asc)
    @videos = @actor.links.joins(:social).where("video = true and socials.name in ('Youtube', 'Vimeo')").order(order_id: :asc)
    imdb_id = Social.find_by(name: "IMDb").id
    @links = @actor.links.where(video: false).where.not(social: imdb_id).order(order_id: :asc)
    @imdb_link = @actor.links.where(video: false, social: imdb_id).first
  end
  
  def new
    @actor = Actor.new
  end
  
  def create
    @actor = Actor.new(actor_params)
    
    if @actor.save
      redirect_to actor_links_path(@actor)
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update
    ordered_photo_ids_sanitize
    if @actor.update(actor_params)
      respond_to do |format|
        format.html { redirect_to actor_links_path(@actor) }
        format.json { render json: { message: "Ordem alterada!" }.to_json }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: { message: "Erro de processamento!" }.to_json }
      end
    end
  end
  
  def destroy
    @actor.destroy

    redirect_to root_path, status: :see_other
  end

  def delete_photo
    full_name = params[:actor_name].split("-")
    @actor = Actor.find_by(first_name: full_name.first, last_name: full_name.last)

    @photo = @actor.photos.find { |photo| photo.signed_id == params[:photo_id] }
    @photo.purge

    redirect_to edit_actor_path(@actor), status: :see_other
  end

  private

  def set_actor
    full_name = params[:name].split("-")
    @actor = Actor.find_by(first_name: full_name.first, last_name: full_name.last)
  end
  

  def actor_params
    params.require(:actor).permit(:first_name, :last_name, :email, :phone_number, :bio, :bio_en, :height, :hair, :hair_en, :eyes, :eyes_en, :min_age, :max_age, :skills, :skills_en, :languages, :languages_en, :primary_photo, :pt_cv, :en_cv, photos: [], ordered_photo_ids: [])
  end

  def ordered_photo_ids_sanitize
    params[:actor][:ordered_photo_ids] = params[:actor][:ordered_photo_ids].first.split(",")
  end
end
