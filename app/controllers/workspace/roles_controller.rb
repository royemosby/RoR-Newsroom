class Workspace::RolesController < ApplicationController

  #TODO Roles actions: new, create, edit, update, destroy
  def index
    @roles = Role.all
  end
end
