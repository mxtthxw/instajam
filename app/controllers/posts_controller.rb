class PostsController < ApplicationController
  def new
    # current_user
    @post = Post.new
  end

  def create
    # current_user
    @post = Post.new(post_params)
    @post.save
    redirect_to post_path(@post)
  end

  def index
    # current_user
    @posts = Post.all
  end

  def show
    # current_user
    @post = Post.find(params[:id])
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:artist, :caption, :city, :date, :user_id)
  end
end
