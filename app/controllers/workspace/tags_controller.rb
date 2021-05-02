class Workspace::TagsController < ApplicationController

  before_action :logged_on

  #TODO delete buttons for tags
  #TODO show usage stats
  def index
    @tags = Tag.all
  end

  def destroy
    tag = Tag.find(id: params[:id])
    tag.destroy
  end

  def tag_params
    params.require(:tag).permit(name)
  end
end
