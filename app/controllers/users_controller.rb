class UsersController < ApplicationController
  before_action :require_login

  def show
    user = User.find(params.require(:id))
    render json: user
  end

  def create
    user = User.create(user_params)
    if user.valid?
      render json: { token: token(user.id), user_id: user.id  }
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private 
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
