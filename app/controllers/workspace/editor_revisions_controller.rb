class Workspace::EditorRevisionsController < ApplicationController

  #TODO consider grouping editor revisions by editor and article. Could scope.

  def index
    if params[:article_id]
      @editor_revisions = Article.find(params[:article_id]).editor_revisions
    else
      @editor_revisions = EditorRevision.all
    end
  end
end
