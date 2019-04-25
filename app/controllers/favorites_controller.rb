class FavoritesController < ApplicationController
  skip_before_action :authorize!

  def index
    @favorites = Favorite.all
    render json: @favorites.all_json
  end
end
