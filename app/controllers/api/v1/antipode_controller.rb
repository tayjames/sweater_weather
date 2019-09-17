class Api::V1::AntipodeController < ApplicationController
  def index
    # render json: AntipodeFacade.new(params[:location]).antipode
    antipode = AntipodeFacade.new(params[:location])
    render json: AntipodeSerializer.new(antipode)
  end
end
