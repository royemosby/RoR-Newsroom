class Workspace::EditorRevisionsController < ApplicationController

  before_action :logged_on

  def index
    if params[:article_id]
      @editor_revisions = Article.find(params[:article_id]).editor_revisions
    else
      @editor_revisions = EditorRevision.all
    end
  end

  def show
  end

  def new
    if params[:article_id]
      @editor_revision = EditorRevision.new
      @editor_revision.article = Article.find_by(id: params[:article_id])
    else
      redirect_to workspace_employee_path(session[:employee_id]), alert: "Editor revisions cannot be made without being associated with an article."
    end
  end

  def create
    @editor_revision = EditorRevision.create(revision_params)
    if @editor_revision.save
      redirect_to workspace_article_path(@editor_revision[:article_id]), success: "Editor revision posted successfully."
    else
      render new, alert: "Form did not save successfully."
    end
  end

  def revision_params
    params.require(:editor_revision).permit(:content, :article_id, :reviewer_id)
  end
end
