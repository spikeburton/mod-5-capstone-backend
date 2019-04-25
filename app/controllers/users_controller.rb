class UsersController < ApplicationController
  # skip_before_action :authorize!

  def create
    @user = User.new(user_params)
    if @user && @user.valid?
      @user.save
      token = encode_token(user_id: @user.id)
      render json: @user.to_json, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation, :email, :first_name, :last_name)
  end
end
