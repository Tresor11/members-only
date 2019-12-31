# frozen_string_literal: true

class PostsController < ApplicationController
  skip_before_action :require_login, only: [:index]
  def index
    @pots=Post.all
  end
end
