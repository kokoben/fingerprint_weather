class LocationsController < ApplicationController
  def index
    @locations = MetaWeather.new(params).search if params[:query]
  end

  def show
    @location = MetaWeather.new(params).location_data
    @weatherStates = {}

    # add weather states
    @location['consolidated_weather'].each do |report|
      case report['weather_state_abbr']
      when 'sn'
        @weatherStates[report['id']] = {path: 'https://www.metaweather.com/static/img/weather/png/64/sn.png', text: 'Snow'}
      when 'sl'
        @weatherStates[report['id']] = {path: 'https://www.metaweather.com/static/img/weather/png/64/sl.png', text: 'Sleet'}
      when 'h'
        @weatherStates[report['id']] = {path: 'https://www.metaweather.com/static/img/weather/png/64/h.png', text: 'Hail' }
      when 't'
        @weatherStates[report['id']] = {path: 'https://www.metaweather.com/static/img/weather/png/64/t.png', text: 'Thunderstorm'}
      when 'hr'
        @weatherStates[report['id']] = {path: 'https://www.metaweather.com/static/img/weather/png/64/hr.png', text: 'Heavy Rain'}
      when 'lr'
        @weatherStates[report['id']] = {path: 'https://www.metaweather.com/static/img/weather/png/64/lr.png', text: 'Light Rain'}
      when 's'
        @weatherStates[report['id']] = {path: 'https://www.metaweather.com/static/img/weather/png/64/s.png', text: 'Showers'}
      when 'hc'
        @weatherStates[report['id']] = {path: 'https://www.metaweather.com/static/img/weather/png/64/hc.png', text: 'Heavy Cloud'}
      when 'lc'
        @weatherStates[report['id']] = {path: 'https://www.metaweather.com/static/img/weather/png/64/lc.png', text: 'Light Cloud'}
      else
        @weatherStates[report['id']] = {path: 'https://www.metaweather.com/static/img/weather/png/64/c.png', text: 'Clear'}
      end
    end
  end
end
