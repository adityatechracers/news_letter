class StaticPagesController < ApplicationController

  def home
    if logged_in? 
      @tags = current_user.tags
    end
  end

  def about
  end
end
