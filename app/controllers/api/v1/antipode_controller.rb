class Api::V1::AntipodeController < ApplicationController
  def index
    antipode = AntipodeFacade.new(params[:location])
    render json: AntipodeSerializer.new(antipode)
  end
end
