class NewsController < ApplicationController

  #TODO Static helper to handle ABOUT and SUBMIT A LEAD
  def index
    @articles = Article.published_articles
  end

  def show
    @article = Article.find_by(id: params[:id])
  end
end
