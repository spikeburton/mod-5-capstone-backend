class DrivesController < ApplicationController
  skip_before_action :authorize!, only: [:index]

  def index
    @drives = Drive.all
    render json: @drives
  end

  def show
    @drive = Drive.find(params[:id])
    render json: @drive
  end

  def create
    @drive = Drive.new(drive_params)
    if @drive && @drive.valid?
      @drive.save
      render json: @drive, status: :created
    else
      render json: { errors: @drive.errors.full_messages }, status: :not_acceptable
    end
  end

  private

  def drive_params
    params.permit(:name, :description, :state, :bound_a_lng, :bound_a_lat, :bound_b_lng, :bound_b_lat)
  end
end
