class OrganizationsController < ApplicationController
  def index
    org = Organization.new(current_user)
    @orgs = org.all
  end
end
