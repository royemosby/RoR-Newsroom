class Workspace::ArticlesController < ApplicationController

  #TODO How to handle article publishing view?
  #TODO Add in tags (csv with find_or_create_by)
  #TODO If article has editor_revisions, show them
  before_action :find_article, only: [:show, :edit, :update]
  before_action :logged_on

  def index
    if params[:employee_id]
      @articles = Employee.find(params[:employee_id]).articles
    else
      @articles = Article.by_status
    end
  end
  
  #TODO add more info to page (status, editor review comments, edit button(if assigned to params[:employee_id]))
  def show
    @article = Article.find_by(id: params[:id])
  end

  #TODO build out form to include dropdowns for assignment and article status
  def new
    @article = Article.new
  end

  #TODO autoassign for journalists (has "edit", "assign" only to self auths)
  #TODO author assignment dropdown for "create" auth
  def create
    @article = Article.create(article_params)
    if @article.save
      redirect_to workspace_article_path(@article)
    else
      render :edit, alert: "This article was not saved."
    end
  end

  #TODO determine edit capabilities (status field change, content, assigned to, etc)
  def edit
  end

  #TODO set date_published if the article's status is updated to publish
  def update
    @article.update(article_params)
    if @article.save
      redirect_to workspace_article_path(@article)
    else
      render :edit, alert: "Changes were not saved. See errors below."
    end
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :status, :employee_id, tag_ids: [])
  end

end
