class Workspace::ArticleUpdatesController < ApplicationController

  # TODO consider order ArticleUpdates by recency
  # TODO does ArticleUpdates need an isolated form?

  def index
    @article_updates = ArticleUpdate.all
  end
end
