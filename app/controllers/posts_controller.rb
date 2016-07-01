class PostsController < ApplicationController

  before_action :admin_user, only: [:new, :create, :destroy]
  before_action :logged_in_user, only: [:index, :show]

  def index
    @posts = Post.paginate(page: params[:page])
  end
  
  def show
    @post = Post.find(params[:id]) 
  end
  
  def new
    @post     = Post.new
    @all_tags = Tag.all
    @post_tag = @post.taggings.build
  end
  
  def create
  	@post = Post.new(post_params)
    params[:tags][:id].each do |tag|
    @post.taggings.build(:tag_id => tag)
    end

    if @post.save
      flash[:success] = "Micropost created!"
      redirect_to index_post_path
    else
      @feed_items = []
      render 'new'
    end
  end
  
  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted"
    redirect_to request.referrer || root_url
  end
  
  private
    
    def post_params
      params.require(:post).permit(:subject, :description, :tag_id)
    end    
end
