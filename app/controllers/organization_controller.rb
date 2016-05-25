class OrganizationController < ApplicationController
  def index
    @orgs = Organization.all
  end
end
