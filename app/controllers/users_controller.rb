class UsersController < ApplicationController
  def create
    User.create(user_params)

    render json: {}
  end

  def user_params
    params.require(:user).permit(:email, :password, :full_name, :username)
  end
end
