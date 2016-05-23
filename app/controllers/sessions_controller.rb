class SessionsController < ApplicationController
  def create
    render text: request.env["omniauth.auth"].inspect
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
  end
end
