class Workspace::TagsController < ApplicationController

  #TODO verify logon before deleting tags
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
