class Api::V1::DestinationsController < ApplicationController
  before_action :set_destination, only: %i[show edit update destroy]

  def index
    render json: DestinationSerializer.new(Destination.all)
  end

  def show
    render json: DestinationSerializer.new(set_destination)
  end

  def new
    @destination = Destination.new
  end

  def edit
  end

  def create
    render json: DestinationSerializer.new(Destination.create(destination_params)), status: 201
  end

  def update
    if @destination.update(destination_params)
      render json: DestinationSerializer.new(@destination), status: :ok
    else
      render status: 404
    end
  end

  def destroy
    render json: Destination.delete(params[:id])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_destination
    @destination = Destination.find(params[:id])
  end

  def destination_params
    params.require(:destination).permit(:name, :zip, :description, :image_url)
  end
end
