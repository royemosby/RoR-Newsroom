class Workspace::RolesController < ApplicationController

  before_action :logged_on

  def index
    @roles = Role.all
  end
end
