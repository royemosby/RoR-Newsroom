module Workspace::ArticleUpdatesHelper

  def updated_date(article_update)
    article_update.updated_at.strftime("%F")
  end
end
