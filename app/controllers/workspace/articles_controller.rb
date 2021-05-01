class Workspace::ArticlesController < ApplicationController

  #TODO Article actions: new, create, edit, update, destroy
  #TODO How to handle article publishing view?
  #TODO Add in tags (csv with find_or_create_by)
  #TODO If article has editor_revisions, show them
  before_action :find_article, only: [:show, :edit, :update]
  before_action :logged_on

  def index
    if params[:employee_id]
      @articles = Employee.find(params[:employee_id]).articles
    else
      @articles = Article.all
    end
  end
  
  def show
    @article = Article.find_by(id: params[:id])
  end

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

  def edit
  end

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
    params.require(:article).permit(:title, :content, :status)
  end

end
