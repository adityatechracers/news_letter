class StaticPagesController < ApplicationController

  def home
    if logged_in? 
      @post_items = current_user.tags_posts.reverse      
     end
  end

  def about
  end
end
