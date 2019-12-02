class UsersController < ApplicationController
  def show
    user = User.find(params.require(:id))
    render json: user
  end
end
