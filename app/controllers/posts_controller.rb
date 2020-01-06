# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :require_login, only: %i[new create]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user.name
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      flash.now[:danger] = 'there was an error creation this post'
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  private

  def require_login
    unless logged_in? # rubocop:disable Style/GuardClause
      flash[:error] = 'Please login in order to create posts'
      redirect_to login_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
