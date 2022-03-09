class Api::V1::UsersController < ApplicationController
  def create
    if params[:password] == params[:password_confirmation]
      user = User.create(email: params[:email], password: params[:password])
      render json: UsersSerializer.user_return(user)
    else
      render status: 404
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :id, :api_key)
  end
end
