class LocationsController < ApplicationController
  def index
    @locations = MetaWeather.new(params).search if params[:query]
  end

  def show
    @location = MetaWeather.new(params).location_data
  end
end