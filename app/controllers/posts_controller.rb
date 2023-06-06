class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to root_path
    else
      @post = Post.new(post_params)
      render :new      
    end    
  end

    
  private
  
  def post_params
    params.require(:post).permit(:title, :detail, :image).merge(user_id: current_user.id)
  end

end
