class MetaWeather
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def search
    # check if the search has previously been made. if so, use it.
    if Search.find_by(keywords: params[:query])
      p 'search already made'
      search = Search.find_by(keywords: params[:query])
      response = search[:response]
      return response
    # otherwise, perform the search and add to database
    else
      p 'search not found..creating search record'
      searchResponse = RestClient.get('https://www.metaweather.com/api/location/search/', params: { query: params[:query] })
      searchResponse = JSON.parse(searchResponse.body)
      search = Search.new(response: searchResponse, keywords: params[:query])
      search.save
      return searchResponse
    end
  rescue
    []
  end

  def location_data
    if Location.find_by(locId: params[:id])
      p 'found location'
      appLocation = Location.find_by(locId: params[:id])

      # get time data to calculate age of location record
      dateUpdated = appLocation.updated_at.utc
      d = DateTime.now.utc

      # if location record exists but is older than 10 minutes, make new query and
      # update the record with newest location data. use the new response.
      if d - dateUpdated > 600
        p 'record is older than 10 min'
        queryResponse = RestClient.get("https://www.metaweather.com/api/location/#{params[:id]}")
        queryResponse = JSON.parse(queryResponse.body)
        location = Location.find_by(locId: params[:id])
        location.response = queryResponse
        location.save
      else
        p 'record is newer than 10 min'
      # otherwise, just use the currently stored record's response.
        queryResponse = appLocation[:response]
      end

      return queryResponse
    # if no entry exists, make the query and add to database. use the new response.
    else
      p 'no record found, creating new location record'
      queryResponse = RestClient.get("https://www.metaweather.com/api/location/#{params[:id]}")
      queryResponse = JSON.parse(queryResponse.body)
      location = Location.new(response: queryResponse, locId: params[:id])
      location.save
      return queryResponse
    end
  rescue
    {}
  end
end
