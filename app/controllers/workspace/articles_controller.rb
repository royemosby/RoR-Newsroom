class Workspace::ArticlesController < ApplicationController

  before_action :find_article, only: [:show, :edit, :update]
  before_action :logged_on

  def index
    if params[:employee_id]
      @articles = Employee.find(params[:employee_id]).articles
    else
      @articles = Article.by_status
    end
  end
  
  def show
    @article = Article.find_by(id: params[:id])
  end

  def new
    @article = Article.new
  end

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
    old_status = Article.find_by(params[:id]).status
    @article.update(article_params)
    if @article.status == "published" && old_status != "published"
      @article.published_date = Time.now
    end
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
