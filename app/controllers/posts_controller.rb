# frozen_string_literal: true

class PostsController < ApplicationController
  include SessionsHelper
  # skip_before_action :logged, only: [:index]
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

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
