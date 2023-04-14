require 'jwt'

class Api::V1::CommentsController < Api::V1::ApplicationController
  load_and_authorize_resource
  before_action :find_post_params, only: %i[index create]

  def index
    if @post
      @comments = Comment.where(post_id: params[:post_id])
      render json: @comments
    else
      render json: { status: 'Failure', error: 'Post Not Found' }
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = @auth_user
    @comment.post = @post

    if @comment.save
      render json: { status: 'Success', comment: @comment }
    else
      render json: { status: 'Failure', error: 'Comment Not Created' }
    end
  end

  def find_post_params
    @post = Post.find_by_id(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
