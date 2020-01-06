# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :check_input, only: [:create]

  def new; end

  def create
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user&.authenticate(params[:sessions][:password])
      flash[:success] = "Welcome #{user.name}"
      log_in user
      remember user
      redirect_to user
    else
      flash.now[:danger] = 'check the informations you provided'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def check_input
    if params[:sessions][:email].blank? # rubocop:disable Style/GuardClause
      flash.now[:danger] = 'Please enter your login details'
      render :new
    end
  end
end
