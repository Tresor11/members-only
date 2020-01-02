# frozen_string_literal: true

class PostsController < ApplicationController
  include SessionsHelper
  include PostsHelper
  # skip_before_action :logged, only: [:index]
  def index
    @posts=Post.all
  end

  def new
    @post=Post.new
  end

  def create
    @post=Post.new(post_params)
    # @post.author=params[:name]
    # @post.user_id=params[:user_id]

    if @post.save
      render :index
    else
      flash.now[:danger]="there was an error creation this post"
    end
  end

  def show
    @post=Post.find_by(id: params[:id])
  end
end
