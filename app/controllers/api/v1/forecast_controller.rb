class Api::V1::ForecastController < ApplicationController
  def index
    forecast = Forecast.new(params[:location])
  end
end
