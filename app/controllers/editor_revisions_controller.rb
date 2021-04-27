class EditorRevisionsController < ApplicationController

  #TODO consider grouping editor revisions by editor and article. Could scope.

  def index
    @editor_revisions = EditorRevision.all
  end
end
