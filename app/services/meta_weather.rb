class MetaWeather
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def search
    response = RestClient.get('https://www.metaweather.com/api/location/search/', params: { query: params[:query] })
    JSON.parse(response.body)
  rescue
    []
  end

  def location_data
    response = RestClient.get("https://www.metaweather.com/api/location/#{params[:id]}")
    JSON.parse(response.body)
  rescue 
    {}
  end
end