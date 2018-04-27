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
    # check if location has previously been searched. if so, use the sql entry
    if Location.find_by(locId: params[:id])
      p 'found poop'
      appLocation = Location.find_by(locId: params[:id])
      response = appLocation[:response]
      JSON.parse(response.body)
    # otherwise, make the query and add the sql entry
    else
      p 'found no poop'
      queryResponse = RestClient.get("https://www.metaweather.com/api/location/#{params[:id]}")
      @location = Location.new(response: queryResponse, locId: params[:id])
      @location.save
      JSON.parse(queryResponse.body)
    end
  rescue
    {}
  end
end
