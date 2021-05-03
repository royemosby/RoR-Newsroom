class Workspace::RolesController < ApplicationController
#Leaving in for project expansion using authorizations based on roles
  before_action :logged_on

  def index
    @roles = Role.all
  end
end
