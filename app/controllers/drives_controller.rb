class DrivesController < ApplicationController
  skip_before_action :authorize!

  def index
    @drives = Drive.all
    render json: @drives
  end

  def show
    @drive = Drive.find(params[:id])
    render json: @drive
  end
end
