require 'jwt'

class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.valid?
      token = JWT.encode { user_id: user.id }, ENV['JWT_SECRET'], 'HS256'
      render json: {
        token: token
      }
      return
    end

    render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
  end

  def user_params
    params.permit(user: [:email, :password, :full_name, :username])[:user] or {}
  end
end
