class ComboFacade
  def self.get_both(city)
    weather_data = WeatherService.search_by_city(city)
    weather = Weather.new(weather_data)
    json = GiphyService.search_by_condition(weather.summary)

    response = weather_data.merge(json)
    final = DestinationWeather.new(response)
  end
end