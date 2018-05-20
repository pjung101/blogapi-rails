require 'jwt'

class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:user][:email].downcase)

    if user && user.authenticate(params[:user][:password])
      token = JWT.encode { user_id: user.id }, ENV['JWT_SECRET'], 'HS256'
      render json: {
        token: token
      }
      return
    end

    render json: { errors: ["Invalid email or password"] }, status: :unprocessable_entity
  end
end
