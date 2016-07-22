class PostsController < ApplicationController
  
  def index
    @posts = Post.posted
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      render 'show', status: 200
    else
      render 'new', status: 303
    end    
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :status)
    end


end
