class PostsController < ApplicationController
  before_action :init_post, only: [:update, :edit, :destroy]
  after_action :update_user_statistic, only: [:create, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc).includes(:comments)
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
    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    @post.destroy
    redirect_to :back
  end

  private

    def init_post
      @post = current_user.posts.find(params[:id])
    end

    def update_user_statistic
      return unless @post.errors.blank?
      current_user.update_attribute(:posts_count, current_user.posts.length)
    end

    def post_params
      params.require(:post).permit(:title, :content, :status)
    end


end
