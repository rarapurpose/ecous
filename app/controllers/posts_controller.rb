class PostsController < ApplicationController 
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, except: [:index, :show]

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

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @like = Like.new
  end

  def edit
    @post = Post.find(params[:id])
    unless  @post.user_id == current_user.id
      redirect_to action: :index      
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
     @post.destroy
    redirect_to new
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :detail, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end