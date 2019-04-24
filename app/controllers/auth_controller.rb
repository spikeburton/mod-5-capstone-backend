class AuthController < ApplicationController
  def login
    @user = User.find_by(username: login_params[:username])
    if @user && @user.authenticate(login_params[:password])
      # login user
      binding.pry
    else
      render json: { errors: ["Invalid username or password"] }, status: :unauthorized
    end
  end

  private

  def login_params
    params.require(:user).permit(:username, :password)
  end
end
