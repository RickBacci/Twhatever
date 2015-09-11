class UsersController < ApplicationController
  def show
  end

  def tweet
    client.update(params[:tweet])
    flash[:success] = "Tweet sent!"
    redirect_to root_path
  end

  def favorite
    client.favorite(params[:favorite])
    flash[:success] = "Tweet favorited!"
    redirect_to root_path
  end

  def unfavorite
    client.unfavorite(params[:unfavorite])
    flash[:success] = "Tweet unfavorited!"
    redirect_to root_path
  end

  def tweet_reply
    client.update(params[:tweet_reply], in_reply_to_status_id: params[:tweet_id])
  end

  private

  def client
    current_user.twitter_client
  end
end
