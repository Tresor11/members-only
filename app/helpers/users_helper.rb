# frozen_string_literal: true

module UsersHelper
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
