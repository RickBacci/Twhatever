class SessionsController < ApplicationController

  def create
    user = User.find_or_create_from_oauth(auth_data)

    if user
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in!"
      redirect_to root_path
    else
      flash[:danger] = "Unable to authenticate you!"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out!"
    redirect_to root_path
  end

  private

  def auth_data
    request.env['omniauth.auth']
  end
end
