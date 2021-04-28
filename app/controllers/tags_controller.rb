class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  #TODO build out Tag show to include associated articles
  def show
    @tag = Tag.find_by(id: params[:id])
  end
end
