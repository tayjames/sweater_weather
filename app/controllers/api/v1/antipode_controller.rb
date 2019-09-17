class Api::V1::AntipodeController < ApplicationController
  def index
    render json: AntipodeFacade.new(params[:location]).antipode
  end
end
