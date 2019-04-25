class UsersController < ApplicationController
  skip_before_action :authorize!, except: [:profile]

  def create
    @user = User.new(user_params)
    if @user && @user.valid?
      @user.save
      token = encode_token(user_id: @user.id)
      render json: { user: @user.to_json, jwt: token } , status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :not_acceptable
    end
  end

  def profile
    render json: { user: current_user.to_json }
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation, :email, :first_name, :last_name)
  end
end
