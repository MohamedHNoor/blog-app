class PostsController < ApplicationController
  def index
    @user = User.includes(:posts, :comments).find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.likes_counter = 0
    @post.comments_counter = 0
    return unless @post.save

    redirect_to user_posts_path
    flash[:success] = 'Post created!'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
