class DrivesController < ApplicationController
  def index
    @drives = Drive.all
    render json: @drives
  end

  def show
    @drive = Drive.find(params[:id])
    render json: @drive
  end
end
