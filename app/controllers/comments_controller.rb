class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post = Post.find(params[:post_id])
    return unless @comment.save

    redirect_to user_post_path(current_user.id, params[:post_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(current_user.id, params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
