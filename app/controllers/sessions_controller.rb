# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:sessions][:email].downcase)
    if @user&.authenticate(params[:sessions][:password])
      flash[:success] = "Welcome #{@user.name}"
      redirect_to @user
    else
      flash.now[:danger] = 'check the informations you provided'
      render :new
    end
  end
end
