class Api::V1::SessionsController < ApplicationController

  def login
    user = User.find_by(email: params[:email])
    if user != nil
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        session[:email] = user.email
        session[:api_key] = user.api_key

        render json: SessionsSerializer.session_return(session)
      else
        render json: { data: { error: 'Incorrect login credentials'}}
      end
    else
      render json: { data: { error: 'Incorrect login credentials'}}
    end
  end

  # private
  #
  # def user_params
  #   params.require(:user).permit(:email, :password)
  # end
end
