class UsersController < ApplicationController
  def show
  end


  def tweet
    current_user.twitter_client.update(params[:tweet])
    redirect_to root_path
  end
end
