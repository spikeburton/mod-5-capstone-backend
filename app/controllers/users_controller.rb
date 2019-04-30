class UsersController < ApplicationController
  skip_before_action :authorize!, except: [:profile, :update]

  def index
    @users = User.all
    render json: @users.all_json
  end

  def create
    @user = User.new(user_params)
    if @user && @user.valid?
      @user.save
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, jwt: token } , status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :not_acceptable
    end
  end

  def profile
    render json: { user: current_user.to_json }
  end

  def settings
    @user = current_user
    if @user.update(user_params)
      render json: { user: current_user.to_json }, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation, :email, :first_name, :last_name)
  end
end
