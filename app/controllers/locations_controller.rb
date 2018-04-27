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
        p 'adding sn'
        @weatherStates[report['id']] =  'https://www.metaweather.com/static/img/weather/png/64/sn.png'
      when 'sl'
        p 'adding sl'
        @weatherStates[report['id']] = 'https://www.metaweather.com/static/img/weather/png/64/sl.png'
      when 'h'
        p 'adding h'
        @weatherStates[report['id'] = 'https://www.metaweather.com/static/img/weather/png/64/h.png']
      when 't'
        p 'adding t'
        @weatherStates[report['id'] = 'https://www.metaweather.com/static/img/weather/png/64/t.png']
      when 'hr'
        p 'adding hr'
        @weatherStates[report['id'] = 'https://www.metaweather.com/static/img/weather/png/64/hr.png']
      when 'lr'
        p 'adding lr'
        @weatherStates[report['id'] = 'https://www.metaweather.com/static/img/weather/png/64/lr.png']
      when 's'
        p 'adding s'
        @weatherStates[report['id'] = 'https://www.metaweather.com/static/img/weather/png/64/s.png']
      when 'hc'
        p 'adding hc'
        @weatherStates[report['id'] = 'https://www.metaweather.com/static/img/weather/png/64/hc.png']
      when 'lc'
        p 'adding lc'
        @weatherStates[report['id'] = 'https://www.metaweather.com/static/img/weather/png/64/lc.png']
      else
        p 'adding c'
        @weatherStates[report['id'] = 'https://www.metaweather.com/static/img/weather/png/64/c.png']
      end
    end
    p 'weather states: '
    p @weatherStates
  end
end
