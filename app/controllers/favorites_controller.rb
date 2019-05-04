class FavoritesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @favorite = Favorite.create(user_id: current_user.id, article_id: params[:article_id])
    @article.reload
  end

  def destroy
    @article = Article.find(params[:article_id])
    @favorite = Favorite.find_by(user_id: current_user.id, article_id: params[:article_id])
    @favorite.destroy
    @article.reload
  end
  
  def index
    @favorites = Favorite.where(user_id: current_user.id).page(params[:page]).per(2)
    # logger.debug @favorites
    # @articles = Article.where(article_id: @favorites.article_id)
  end
end
