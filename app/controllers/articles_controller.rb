class ArticlesController < ApplicationController
  before_action :set_actor

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(link_params)
    @article.actor = @actor

    if @article.save
      redirect_to actor_articles_path(@actor)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_actor
    full_name = params[:actor_name].split("-")
    @actor = Actor.find_by(first_name: full_name.first, last_name: full_name.last)
  end

  def article_params
    params.require(:article).permit(:url, :image)
  end
end
