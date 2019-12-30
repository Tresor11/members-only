class UsersController < ApplicationController
  include UsersHelper
  def index
  end
  def new
    @user=User.new()
  end
  def create
    @user=User.new(user_params)
    if @user.save
      redirect_to @user
    end
  end
end
