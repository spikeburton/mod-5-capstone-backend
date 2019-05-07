class PhotosController < ApplicationController
  def create
    @photo = current_user.photos.build(photo_params)
    if @photo && @photo.valid?
      @photo.save
      render json: @photo, status: :created
    else
      render json: { errors: @photo.errors.full_messages }, status: :unacceptable
    end
  end

  private

  def photo_params
    params.permit(:user_id, :drive_id, :image_url)
  end
end
