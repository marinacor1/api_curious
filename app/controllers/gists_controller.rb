class GistsController < ApplicationController
  def index
    gist = Gist.new(current_user)
    @gists = gist.all
  end
end
