class Api::V1::GifsController < ApplicationController
  def index
    # render json: GifsFacade.new(params[:location]).gif
    gif = GifsFacade.new(params[:location])
    render json: GifsSerializer.new(gif)
  end
end
