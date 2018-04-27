class MetaWeather
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def search
    # check if the search has previously been made. if so, use it.
    if Search.find_by(keywords: params[:query])
      search = Search.find_by(keywords: params[:query])
      response = search[:response]
      return response
    # otherwise, perform the search and add to database
    else
      searchResponse = RestClient.get('https://www.metaweather.com/api/location/search/', params: { query: params[:query] })
      searchResponse = JSON.parse(searchResponse.body)
      @search = Search.new(response: searchResponse, keywords: params[:query])
      @search.save
      return searchResponse
    end
  rescue
    []
  end

  def location_data
    # check if location has previously been searched. if so, use it.
    if Location.find_by(locId: params[:id])
      appLocation = Location.find_by(locId: params[:id])
      response = appLocation[:response]
      return response
    # otherwise, make the query and add to database
    else
      queryResponse = RestClient.get("https://www.metaweather.com/api/location/#{params[:id]}")
      queryResponse = JSON.parse(queryResponse.body)
      @location = Location.new(response: queryResponse, locId: params[:id])
      @location.save
      return queryResponse
    end
  rescue
    {}
  end
end
