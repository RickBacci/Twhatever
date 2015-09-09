class SessionsController < ApplicationController

  def create
    user = User.find_or_create_from_oauth(auth_data)

    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      raise "Unable to login with Twitter"
      redirect_to root_path
    end
  end


  private

  def auth_data
    request.env['omniauth.auth']
  end
end
