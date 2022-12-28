class ArticlesController < ApplicationController
  before_action :set_actor, except: [:destroy]
  before_action :set_article, only: [:update, :destroy]

  def index
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.actor = @actor

    if @article.save
      redirect_to actor_articles_path(@actor)
    else
      render :index, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      redirect_to actor_article_path(@actor)
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy

    redirect_to actor_articles_path(@article.actor), status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def set_actor
    full_name = params[:actor_name].split("-")
    @actor = Actor.find_by(first_name: full_name.first, last_name: full_name.last)
  end

  def article_params
    params.require(:article).permit(:url, :image)
  end
end
