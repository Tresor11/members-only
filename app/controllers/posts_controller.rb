# frozen_string_literal: true

class PostsController < ApplicationController
  skip_before_action :require_login, only: [:index]
  def index
    @pots=Post.all
  end

  def new
    @post=Post.new
  end

  def create
    @post=Post.new(post_params)
  end
end
