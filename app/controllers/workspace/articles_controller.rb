class Workspace::ArticlesController < ApplicationController

  #TODO Article actions: new, create, edit, update, destroy
  #TODO How to handle article publishing view?

  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find_by(id: params[:id])
  end
end
