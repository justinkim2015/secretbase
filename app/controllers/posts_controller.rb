class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def user_params
    params.require(:post).permit(:title, :body)
  end

  def require_login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
