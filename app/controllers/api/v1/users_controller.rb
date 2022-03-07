class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(email: params[:email], password: params[:password])
    render json: UsersSerializer.user_return(user)
  end

  def login
    User.find_by(email: par)
    # render json: UsersSerializer.user_return
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
