class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = Comment.by_post_and_user(params[:post_id], current_user.id)
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
    else
    end
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:post_id, :description)
    end
end
