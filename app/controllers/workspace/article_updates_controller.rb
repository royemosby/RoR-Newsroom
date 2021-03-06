class Workspace::ArticleUpdatesController < ApplicationController

  before_action :find_update, only: [:show, :edit, :delete]
  before_action :logged_on
  # TODO consider order ArticleUpdates by recency
  # TODO does ArticleUpdates need an isolated form?

  def index
    @article_updates = ArticleUpdate.all
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
  
  def find_update
    @article_update = ArticleUpdate.find(params[:id])
  end

  def update_params
    params.require(:article_update).permit(:content, :article_id)
  end
end
