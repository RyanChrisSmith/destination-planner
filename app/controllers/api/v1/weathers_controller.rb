class Api::V1::WeathersController < ApplicationController
  def show
    render json: ComboFacade.get_both(params[:destination_id])
  end
end
