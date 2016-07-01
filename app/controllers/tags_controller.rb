class TagsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show]
  before_action :admin_user, only: [:new, :create, :destroy]
  

  def index
    #@tags=Tag.all
    @tags = Tag.paginate(page: params[:page])
  end
  
  def show
    @tag = Tag.find(params[:id])

  end
  
  def new
    @tag = Tag.new
  end
  
  def create
  	@tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = "tag created!"
      redirect_to index_tag_path
    else
      @feed_items = []
      render 'new'
    end
  end
  
  def destroy
    Tag.find(params[:id]).destroy
    flash[:success] = "Tag deleted"
    redirect_to request.referrer || root_url
  end

  
  private
    
    def tag_params
      params.require(:tag).permit(:name)
    end
end
