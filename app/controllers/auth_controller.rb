class AuthController < ApplicationController
  # skip_before_action :authorize!, only: [:login]

  def login
    @user = User.find_by(username: login_params[:username])
    if @user && @user.authenticate(login_params[:password])
      # login user
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, jwt: token }, status: :accepted
    else
      render json: { errors: ["Invalid username or password"] }, status: :unauthorized
    end
  end

  private

  def login_params
    params.require(:user).permit(:username, :password)
  end
end
