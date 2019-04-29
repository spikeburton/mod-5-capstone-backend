class FavoritesController < ApplicationController
  skip_before_action :authorize!, only: [:index]

  def index
    @favorites = Favorite.all
    render json: @favorites.all_json
  end

  def create
    @favorite = current_user.favorites.build(favorite_params)
    if @favorite && @favorite.valid?
      @favorite.save
      render json: @favorite, status: :created
    else
      render json: { errors: @favorite.errors.full_messages }, status: :not_accepted
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite && @favorite.destroy
      render json: {}, status: :no_content
    else
      render json: { errors: @favorite.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:drive_id, :user_id)
  end
end
