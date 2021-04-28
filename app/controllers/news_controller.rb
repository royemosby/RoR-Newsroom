class NewsController < ApplicationController

  def index
    #TODO helper scope to published articles
    @articles = Article.all
  end

  def show
    @article = Article.find_by(id: params[:id])
  end
end
