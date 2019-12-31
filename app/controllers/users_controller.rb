# frozen_string_literal: true

class UsersController < ApplicationController
  include UsersHelper
  include SessionsHelper
  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    redirect_to @user if @user.save
    log_in @user
    remember @user
  end

  def show
    @user = User.find_by(params[:id])
  end
end
