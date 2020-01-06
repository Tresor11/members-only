# frozen_string_literal: true

class UsersController < ApplicationController
  include UsersHelper
  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.name}"
      log_in @user
      remember @user
      redirect_to @user
    else
      flash.now[:error] = 'You have entered incorrect details'
      render :new
    end
  end

  def show
    @user = User.find_by(params[:id])
  end
end
