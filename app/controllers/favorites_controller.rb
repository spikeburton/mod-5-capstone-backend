class FavoritesController < ApplicationController
  skip_before_action :authorize!

  def index
    @favorites = Favorite.all
    render json: @favorites.all_json
  end

  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite && @favorite.valid?
      @favorite.save
      render json: @favorite, status: :created
    else
      render json: { errors: @favorite.errors.full_messages }, status: :not_accepted
    end
  end

  private

  def favorite_params
    params.permit(:drive_id, :user_id)
  end
end
