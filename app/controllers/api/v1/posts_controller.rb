require 'jwt'
class Api::V1::PostsController < Api::V1::ApplicationController
  before_action :find_user_prams
  def index
    if @user
      @posts = @user.posts.order(created_at: :asc)
      render json: @posts
    else
      render json: { status: 'Failure', error: 'Post Not Found' }
    end
  end

  private

  def find_user_prams
    @user = User.find(params[:user_id])
  end
end
