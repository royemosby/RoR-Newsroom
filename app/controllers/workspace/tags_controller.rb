class Workspace::TagsController < ApplicationController

  before_action :logged_on

  def index
    @tags = Tag.all
  end

  def tag_params
    params.require(:tag).permit(name)
  end
end
