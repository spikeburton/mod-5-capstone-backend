class UsersController < ApplicationController
  skip_before_action :authorize!, only: [:index, :create]

  def index
    @users = User.all
    render json: @users
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
    render json: { user: current_user }
  end

  def settings
    @user = current_user
    if @user.update(user_params)
      render json: { user: current_user }, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :not_acceptable
    end
  end

  def purge
    @user = current_user
    if @user.destroy
      render json: {}, status: :no_content
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation, :email, :first_name, :last_name, :avatar_url)
  end
end
