class SubscriptionsController < ApplicationController
  before_action :logged_in_user

  def create
    @tag = Tag.find(params[:tag_id])
    current_user.follow(@tag)
    redirect_to @tag 
  end
  
  def destroy
    @tag = Subscription.find(params[:id]).tag
    current_user.unfollow(@tag)
    redirect_to @tag
  end
end
