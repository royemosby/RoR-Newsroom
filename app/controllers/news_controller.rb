class NewsController < ApplicationController

  def index
    if params[:tag_id]
      tag = Tag.find_by(id: params[:tag_id])
      @articles = tag.published_articles
    else
      @articles = Article.alpha_published
    end
  end

  def show
    @article = Article.find_by(id: params[:id])
  end
end
