class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new]
  before_filter :authorize_owner, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
    
    respond_to do |format|
      format.html
      format.json {render json: @posts}
    end
  end

  def show
  end
  
  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(posts_params)
    @post.user = current_user
    if @post.save
      redirect_to root_path, notice: 'Post has been created'
    else
      render 'new'
    end
  end

  def update
    if @post.save
      redirect_to @post, notice: 'Post was successfully updated'
    else
      render :edit
    end
  end


  def destroy
    @post.destroy
    flash[:success] = "Post has been deleted"
    redirect_to root_path
  end

  private

  def set_post
    @post=Post.find(params[:id])
  end

  def authorize_owner
    unless current_user==@post.user
      redirect_to root_path, notice: 'This action is not allowed'
    end

  end

  def posts_params
  	params.require(:post).permit(:title, :picture, :description)
  end
end
