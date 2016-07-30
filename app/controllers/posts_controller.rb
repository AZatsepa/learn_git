class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
    @posts = current_user.posts
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new', status: 303
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    @post.update_attributes(post_params)
    redirect_to posts_path
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :status)
    end


end
